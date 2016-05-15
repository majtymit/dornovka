class Post < ActiveRecord::Base
  include Impressionist::IsImpressionable # fix for is_impressionable
  is_impressionable
  validates :title, uniqueness: true, length: { maximum: 45, too_long: "45 characters is the maximum allowed" }
  has_attached_file :image, default_url: "/assets/original/no_pic.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  scope :query, ->(q) {
    attributes = ['title', 'description', 'text' ]
    where(attributes.map{ |attr| "#{attr} LIKE '%#{q}%'" }.join(' OR '))
  }

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