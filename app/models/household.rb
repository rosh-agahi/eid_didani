class Household < ActiveRecord::Base
  has_many :users
  has_many :availabilities
  has_many :memberships
end
