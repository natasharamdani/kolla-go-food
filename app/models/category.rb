class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :foods

  before_destroy :ensure_not_referenced_by_any_food

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end

  private

  def ensure_not_referenced_by_any_food
    unless foods.empty?
      errors.add(:base, 'Foods present')
      throw :abort
    end
  end
end
