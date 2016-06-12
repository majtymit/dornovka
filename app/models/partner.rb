class Partner < ActiveRecord::Base
  include Impressionist::IsImpressionable # fix for is_impressionable
  is_impressionable
  validates :position, uniqueness: true, numericality: :true
  scope :visible, -> { where(visibility: true) }


  has_attached_file :logo,
    default_url: "/assets/original/portfolio-demo.gif",
    url: ":s3_domain_url",
    path: "public/admin/partners/:id_:basename.:extension",
    storage: :fog,
    fog_credentials: {
        provider: 'AWS',
        region: 'eu-central-1',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  #validate :image_dimensions

  #private

  #def image_dimensions
    #required_height = 117
    #dimensions = Paperclip::Geometry.from_file(logo.queued_for_write[:original].path)

    #errors.add(:logo, "Height must be #{height}px") unless dimensions.height == required_height
  #end

end