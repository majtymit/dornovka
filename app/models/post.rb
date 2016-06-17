class Post < ActiveRecord::Base
  include Impressionist::IsImpressionable # fix for is_impressionable
  is_impressionable counter_cache: true, column_name: :visits, :unique => :all
  has_many :blogpictures, dependent: :destroy
  accepts_nested_attributes_for :blogpictures, :reject_if => lambda { |attributes| attributes[:picture].blank? }, :allow_destroy => true

  validates :title, uniqueness: true, length: { maximum: 45, too_long: "45 characters is the maximum allowed" }

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
