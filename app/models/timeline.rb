class Timeline < ActiveRecord::Base
  validates :position, allow_blank: false, uniqueness: true, numericality: :true
end
