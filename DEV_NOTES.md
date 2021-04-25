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
