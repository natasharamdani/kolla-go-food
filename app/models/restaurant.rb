class Restaurant < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: true

  has_many :foods
  has_many :reviews, as: :reviewable

  before_destroy :ensure_not_referenced_by_any_food

  def self.search(name, addr, min, max)
    if name || desc || min || max
      min.blank? ? min = 0 : min = min.to_i
      max = max.to_i
      where('name LIKE ? and description LIKE ? and price >= ? and price <= ?', "%#{name}%", "%#{desc}%", min, max)
    else
      all
    end
  end

  private

  def ensure_not_referenced_by_any_food
    unless foods.empty?
      errors.add(:base, 'Foods present')
      throw :abort
    end
  end
end
