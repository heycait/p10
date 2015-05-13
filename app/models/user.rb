require 'bcrypt'

class User < ActiveRecord::Base

  has_many :events

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "not a valid address", on: :create }
  validates :password_hash, presence: true #, length: { in: 8..20 }


  def password
    # why doesn't password_hash need to be self.password_hash?
    @password ||= BCrypt::Password.new(password_hash) if password_hash.present?
  end

  def password=(set_password)
    @password = BCrypt::Password.create(set_password)
    self.password_hash = @password
  end

end
