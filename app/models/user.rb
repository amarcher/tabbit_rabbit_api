require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :auth_token, uniqueness: true
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

  def generate_authentication_token!
    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: auth_token)
  end

  before_create do
    rabbit = Rabbit.create(name: name, email: email, phone_number: phone_number)
    self.avatar_rabbit_id = rabbit.id
    rabbits << rabbit
    generate_authentication_token!
  end
end
