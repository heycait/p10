class Event < ActiveRecord::Base

  has_one :user

  validates :title, :time, :location, :description, presence: true

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
