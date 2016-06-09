class Therapy < ActiveRecord::Base
  include Impressionist::IsImpressionable # fix for is_impressionable
  is_impressionable
  validates :position, uniqueness: true, numericality: :true

  has_attached_file :picture1, default_url: "/assets/original/no_pic.png"
  validates_attachment_content_type :picture1, content_type: /\Aimage\/.*\Z/
  has_attached_file :picture2, default_url: "/assets/original/no_pic.png"
  validates_attachment_content_type :picture2, content_type: /\Aimage\/.*\Z/
  has_attached_file :picture3, default_url: "/assets/original/no_pic.png"
  validates_attachment_content_type :picture3, content_type: /\Aimage\/.*\Z/

  scope :visible, -> { where(visibility: true) }
end
