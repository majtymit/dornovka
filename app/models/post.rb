class Post < ActiveRecord::Base
  include Impressionist::IsImpressionable # fix for is_impressionable
  is_impressionable
  validates :title, uniqueness: true, length: { maximum: 45, too_long: "45 characters is the maximum allowed" }

  has_attached_file :image,
    default_url: "/assets/original/portfolio-demo.gif",
    url: ":s3_domain_url",
    path: "public/admin/posts/:id_:basename.:extension",
    storage: :fog,
    fog_credentials: {
        provider: 'AWS',
        region: 'eu-central-1',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  default_scope { order(created_at: :desc, title: :asc) }
  scope :query, -> (q) {
    if q.blank?
      all
    else
      attributes = ['title', 'description', 'text']
      where(attributes.map{ |attr| "lower(#{attr}) LIKE '%#{q.downcase}%'" }.join(' OR '))
    end
  }
  scope :featured, -> { where(featured: true) }
  scope :visible, -> { where(visibility: true) }

  def seo_title
    I18n.transliterate(title).gsub(' ', '-').gsub(/[^a-zA-Z0-9-]/, '')
  end

  def to_param
    "#{id}-#{seo_title}"
  end

  def category_sk
    {
      'dogs' => 'psy',
      'horses' => 'kone',
      'cats' => 'mačky',
      'small_pets' => 'malé zvieratá',
      'events' => 'udalosti',
      'status' => 'statusy',
      'methods' => 'metódy',
      'illness' => 'choroby',
    }[category]
  end

  def format_sk
    {
      'article' => 'článok',
      'status' => 'status',
    }[format]
  end

  def sk_comments(number)
    if number == 0 || number > 4
      'komentárov'
    elsif number == 1
      'komentár'
    else
      'komentáre'
    end
  end
end
