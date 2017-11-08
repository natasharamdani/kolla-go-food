class Restaurant < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: true

  has_many :foods
  belongs_to :review

  before_destroy :ensure_not_referenced_by_any_food

  private

  def ensure_not_referenced_by_any_food
    unless foods.empty?
      errors.add(:base, 'Foods present')
      throw :abort
    end
  end
end
