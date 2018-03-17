class Product < ApplicationRecord
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}
  has_many :reviews, dependent: :delete_all

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, validate_media_type: false
  validates_attachment :picture, content_type: { content_type: ["image/jpg", 'image/jpeg', 'image/png'] }
  validates :picture, attachment_presence: true
  # validates_with AttachmentPresenceValidator, attributes: :picture

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    format("%.2f", price_in_dollars)
  end
end
