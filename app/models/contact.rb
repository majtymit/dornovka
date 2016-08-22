class Contact < ActiveRecord::Base
  validates :email, email: true
  validates :subject, presence: true, allow_blank: false
  validates_length_of :subject, in: 3..30
  validates_length_of :message, minimum: 10
end
