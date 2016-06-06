class Faq < ActiveRecord::Base
  validates :position, uniqueness: true, numericality: :true
  scope :visible, -> { where(visibility: true) }
end