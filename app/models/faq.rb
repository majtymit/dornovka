class Faq < ActiveRecord::Base
  validates :position, uniqueness: true, numericality: :true
end
