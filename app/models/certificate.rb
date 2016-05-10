class Certificate < ActiveRecord::Base
  validates :position, uniqueness: true, numericality: :true
  has_attached_file :image, default_url: "/assets/original/no_pic.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
