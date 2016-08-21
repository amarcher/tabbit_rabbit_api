class Item < ActiveRecord::Base
  belongs_to :tab
  has_and_belongs_to_many :rabbits
end
