class Post < ActiveRecord::Base
  belongs_to :category

  scope :query, ->(q) {
    attributes = ['title', 'description', 'text']
    where(attributes.map{ |attr| "#{attr} LIKE '%#{q}%'" }.join(' OR '))
  }
end
