class Event < ActiveRecord::Base
  validates :organizer_name, presence: true

  validates :organizer_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Not a valid email address", on: :create }

  validates :title, { presence: true, uniqueness: true }

  validates :date, presence: true
  validate :date_cannot_be_in_the_past, on: :create


  def date_cannot_be_in_the_past
    # How come you can just call date like this. You don't need it to be a symbol the way it's defined in the table? Or even an instance variable.
    if date < Date.today
      errors.add(:date, "Event date can't be in the past")
    end
  end

end


# need to add validation for invalid date format
