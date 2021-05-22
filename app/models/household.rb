class Household < ActiveRecord::Base
  has_many :users
  has_many :availabilities
  has_many :memberships
  has_many :families, through: :memberships
  has_many :visits 
end
