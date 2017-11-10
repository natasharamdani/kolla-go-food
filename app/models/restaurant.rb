class Restaurant < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: true

  has_many :foods
  has_many :reviews, as: :reviewable

  before_destroy :ensure_not_referenced_by_any_food

  def self.search(name, addr, min, max)
    if name || addr || min || max
      min.blank? ? min = 0 : min = min.to_i
      if max.blank?
        where('name LIKE ? and address LIKE ? and foods.count >= ?', "%#{name}%", "%#{desc}%", min)
      else
        max = max.to_i
        where('name LIKE ? and address LIKE ? and foods.count >= ? and foods.count <= ?', "%#{name}%", "%#{desc}%", min, max)
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
