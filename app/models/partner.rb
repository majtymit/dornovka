class Partner < ActiveRecord::Base
  include Impressionist::IsImpressionable # fix for is_impressionable
  is_impressionable
  validates :position, uniqueness: true, numericality: :true
  has_attached_file :logo, default_url: "/assets/original/no_pic.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  validates_attachment :logo, dimensions: { height: 117, width: 283 }
  scope :visible, -> { where(visibility: true) }

  #validate :image_dimensions

  #private

  #def image_dimensions
    #required_height = 117
    #dimensions = Paperclip::Geometry.from_file(logo.queued_for_write[:original].path)

    #errors.add(:logo, "Height must be #{height}px") unless dimensions.height == required_height
  #end

end