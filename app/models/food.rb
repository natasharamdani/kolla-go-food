class Food < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be an URL for GIF, JPG, or PNG image'
  }

  has_many :line_items
  belongs_to :category, optional: true
  has_and_belongs_to_many :tags, optional: true
  belongs_to :restaurant
  has_many :reviews, as: :reviewable

  before_destroy :ensure_not_referenced_by_any_line_item

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end

  def self.search(name, desc, min, max)
    if name || desc || min || max
      min.blank? ? min = 0 : min = min.to_i
      if max.blank?
        where('name LIKE ? and description LIKE ? and price >= ?', "%#{name}%", "%#{desc}%", min)
      else
        max = max.to_i
        where('name LIKE ? and description LIKE ? and price >= ? and price <= ?', "%#{name}%", "%#{desc}%", min, max)
      end
    else
      all
    end
  end

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
