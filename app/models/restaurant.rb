class Restaurant < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: true

  has_many :foods
  has_many :reviews, as: :reviewable

  before_destroy :ensure_not_referenced_by_any_food

  def self.search(name, addr)
    if name || addr
      where('restaurants.name LIKE ? and address LIKE ?', "%#{name}%", "%#{addr}%")
    else
      all
    end
  end

  def self.count_food(min, max)
    if min || max
      min.blank? ? min = 0 : min = min.to_i
      if max.blank?
        having('count(restaurant_id) >= ?', min)
      else
        max = max.to_i
        having('count(restaurant_id) >= ? and count(restaurant_id) <= ?', min, max)
      end
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
