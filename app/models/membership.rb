class Membership < ActiveRecord::Base
  belongs_to :household
  belongs_to :family

  #this is the membership many to many relationship that links households to families.

end
