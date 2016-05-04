class Post < ActiveRecord::Base
  include Impressionist::IsImpressionable # fix for is_impressionable
  is_impressionable
  belongs_to :category
  has_many :subposts
  validates :title, length: { maximum: 45, too_long: "45 characters is the maximum allowed" }
  has_attached_file :image, :style => { :medium => "300x300#", :thumb => "50x50#" }, :default_url => "/images/:style/no_pic.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


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

  def sk_name
    {
      'dogs' => 'psy',
      'horses' => 'kone',
    }[name]
  end

  def sk_comments(number)
    if number == 0 || number > 4
        return 'komentárov'
    elsif number == 1
      return 'komentár'
    else
      return 'komentáre'
    end
  end
end
