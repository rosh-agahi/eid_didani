class Availability < ActiveRecord::Base
  belongs_to :household
#  belongs_to :user through :household

  
end
