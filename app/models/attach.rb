class Attach < ApplicationRecord
  belongs_to :attacheable, polymorphic: true
  has_many :products, :dependent => :destroy

  #paperclip
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
