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

Plan Application:

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
  /home/settings => see/manage user info
  /household/1/schedule => see list of booked visits for the user's household


Household
  has many familymembers (users)
  belongs to many family groups
  has many appointments
  has many visits
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
