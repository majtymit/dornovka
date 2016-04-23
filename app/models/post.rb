class Post < ActiveRecord::Base
  is_impressionable
  belongs_to :category
  has_many :subposts
  validates :title, length: { maximum: 45, too_long: "45 characters is the maximum allowed" }

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
end
