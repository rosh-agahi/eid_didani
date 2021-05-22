class Family < ActiveRecord::Base
  has_many :memberships
  has_many :households, through: :memberships 
end
