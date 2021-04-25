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
  has one household
  has many families
  authenitication
  email/password
  unique emails

Household
  has many familymembers (users)
  url for viewing appointments 
