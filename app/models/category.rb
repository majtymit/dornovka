class Category < ActiveRecord::Base
  has_many :posts

  def self.non_empty
    all.reject do |category|
      category.posts.count == 0
    end
  end
end
