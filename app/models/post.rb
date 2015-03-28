class Post < ActiveRecord::Base
  belongs_to :category

  scope :search, ->(query) {
    attributes = ['title', 'description', 'text']
    where(attributes.map{ |attr| "#{attr} LIKE '%#{query}%'" }.join(' OR '))
  }
end
