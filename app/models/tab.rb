class Tab < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_and_belongs_to_many :rabbits

  before_create do 
    dine_date = Date.today
  end
end
