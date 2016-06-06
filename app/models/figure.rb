class Figure < ActiveRecord::Base
  validates :position, uniqueness: true, numericality: :true
  has_attached_file :photo, default_url: "/assets/original/no_pic.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  scope :visible, -> { where(visibility: true) }
end