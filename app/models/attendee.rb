require 'sendgrid-ruby'

class Attendee < ActiveRecord::Base

  belongs_to :event

  validates :email, presence: true

  def save(attendees_emails)
    attendees_emails.each do |email|
      Attendee.create!(email: email)
    end
  end
end
