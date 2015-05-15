require 'sendgrid-ruby'

class Attendee < ActiveRecord::Base

  belongs_to :event

  validates :email, presence: true

end
