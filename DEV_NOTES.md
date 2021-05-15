1. installed corneal
2. corneal new eid_didani
3. set up local repo eid_didani
4. connected to github
    git remote add origin https://github.com/rosh-agahi/eid_didani.git
    git branch -M main
    git push -u origin main

5. remove versioning from gemfile
6. remove thin

7. Boot Error when running shotgun
  * updated config.ru to: 'ActiveRecord::Base.connection.migration_context.needs_migration?'
    * website now works

8. Plan Application:

User (aka familymember)
  belongs to one household
  belongs to many families through household
  authenitication
  email/password
  unique emails
  /register
  /login
  /logout
  /home => index of family groups the user is a part of
  /home/settings => see/manage user info (save this for phase 2)
  /household/id/schedule => see list of booked visits for the user's household


Household
  has many familymembers (users)
  belongs to many family groups
  has many appointments
  has many visits (should I make visits and appointments one item?)
  url for viewing appointments
  /households => do not want a user to be able to see an index of all households. #forbidden
  /household/id/invite => invite a user to join a household
  /household/id/calendar => see list of available appointments for the selected household.

Family
  has many households
  has many users through households
  attributes
    * needs unique identifier
    * array of households

  /family/ => shows index of all households in a family group
    * select a household to see their availabilities

Appointment/visits
  belongs to up to 4 households (1 hosting, 3 attending)
  attributes: hosting household, location, attending households, date, timeslot, status (available/(booked/not home))
    * status:
      * if hosting and 3 hshlds attending: booked
      * if hosting and <3 hshlds attending: available
      * if not hosting but attending elsewhere: not home
  Appointment Cards
    * make it look like an invitation
    * full card => shows all relevant info in the format of a formal invitation once the appointment has been booked.
    * browse card => small card for display on household calendar of available slots.


---SPRINT 1: USER FUNCTIONALITY---
1. rake db:create_migration NAME=create_users
 * filled out the migration table in file
 * rake db:migrate
  * not working. will look up establish_connection and sinatra/activerecord/rake - did anything change in the gem.
    * set database needs to be structured with environments so that sinatra-activerecord/blob/master/lib/sinatra/activerecord.rb Line 47 does not trigger as it is deprecated.
    * cleanup config/environment file to:
          ENV['SINATRA_ENV'] ||= "development"
          ENV['RAILS_ENV'] = ENV['SINATRA_ENV'] # maybe the migrator is looking for RAILS_ENV

          require 'bundler/setup'
          Bundler.require(:default, ENV['SINATRA_ENV'])

          set :environment, ENV['SINATRA_ENV'].to_sym

          database_config = {
            :development =>  {
              :adapter => "sqlite3",
              :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
            }
          }

          set :database, database_config

          require './app/controllers/application_controller'
          require_all 'app'
    * add line#2 to app/controllers/application_controller.rb
      1.   class ApplicationController < Sinatra::Base
      2.     <strong> register Sinatra::ActiveRecordExtension </strong>

2. create user model (model/user.rb)
3. create user controller (controllers/users_controller.rb)
  * make a sample get request with "Hello"
  * mount controller on config.ru
    * use UsersController
4. create new user registration form (views/users/new.html.erb)
  * get and post methods with save in users_controller
  * updated user model with has_secure_password

_commit_

5. Login functionality needs sessions enabled
  * in controllers/application_controller.rb add "enable :sessions" as line 3
  * add following lines to users_controller
          get '/login' do
            erb :'users/login.html'
          end

          post '/login' do
            redirect '/'
          end
  *

---SPRINT 2: SETTING UP HOUSEHOLD---
Household is created by a user.
A user can belong to only one household at a time.
Multiple users can belong to one household.
A Household can belong to multiple Family Groups
A household has appointments

--> user creates household --> [user that creates the household is auto set as admin. only the admin user can modify household members and transfer admin power. once admin power is transferred you can't keep acting as admin]
--> user adds other users to their household
--> user can give /admin/ rights to another user in that household (admin rights is like who created it and manages household members - so maybe the household is owned by the admin user)
      use case: a daughter sets up the household for her family, but then she moves out of the house and has to set up a new household because she got married etc so now her dad is the admin of the original household.

- create household (with address) (automatically join household as admin)
- set appointment availabilities (datetime)
- request appointments with other households (includes datetime)
[as admin]
  - add/remove household member
  - change household address
  - give away admin access

household table:
id
name            string
address         string
admin_id        integer = current user id
///availabilities  datetime [array of (datetime and status)] -- nope. availabilities will be own class
  ** user makes request for appointments with other households (this request will also look up their availabilities and if the same datetime doesn't exist, it will add and set status to booked, if it exists it will set status to booked. if the other household declines, it will revert status to available, otherwise it will not change.)

household id /one to many relationship/
user id /rule = one household per user/

1. create migration for household
2. create migration to add name and household id to users
3. created Household model and HouseholdsController
  has many users
  will: has many availabilities * going to need to add that as another class
    availability is a boolean for each datetime. more on that later.


/** from stackoverflow: */-------------------------------------------
class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  attr_accessible :name, :description, :isPublic, :tag_list, :owner
end

class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  #this table has a flag called owner and thus a method called owner?
end

class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, through: :memberships
  attr_accessible :name, :description, :owner_id
end
----------------------------------------------------------------------
/** modified for here: */---------------------------------------------
class Household < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  attr_accessible :name, :address, :isPublic /ooo this is interesting/, :admin
end

class Membership < ActiveRecord::Base
  belongs_to :household
  belongs_to :user

  #this table has a flag called owner and thus a method called owner?
end

class User < ActiveRecord::Base
  has_one?*is that possible? :memberships
  has_many :groups, through: :memberships ?same question here?
  attr_accessible :name
end
----------------------------------------------------------------------
or do I just do:
Household has many users with an admin attribute matching a user_id
User belongs to household (belongs to family through households?)
***** this is not a many to many relationship so I think the more simple version is ok.

SPRINT 3: Availabilities and APPOINTMENTS

appointment table ==> manages all household appointments
id
visiting(REQUESTING) household id     integer
hosting household id                  integer
datetime                              datetime
address                               string (inherits from hosting household)

SPRINT 4: FAMILY GROUPS
family : household
many to many relationship.
this is where I'm going to need the membership joins table.
