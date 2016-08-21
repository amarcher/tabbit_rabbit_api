require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  has_many :rabbits
  has_many :tabs
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  before_create do
    rabbit = Rabbit.create(name: name, email: email, phone_number: phone_number)
    self.avatar_rabbit_id = rabbit.id
    rabbits << rabbit
  end
end
