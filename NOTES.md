notes:

surge.sh -- free web hosting
corneal -- gem for developing new skeleton for sinatra app (specifically for learn.co)
  corneal new name_of_app
# Eid Didani

## Description
This is an app designed to help organize Persian Nowruz Eid Didanis!
Everyone is familiar with the long drives, showing up to a house only to find that your relatives are also out at their eid didanis, and the desperate need to find a restroom after drinking wayyyy too much tea at your auntie's house.

### Components

#### Users
#### Households
#### Family
#### Appointments / Visits

Sinatra Application flow
A user creates a profile.
A user joins their household.
A user, through their household, joins a family group.
A user sets their family's available appointments.
Appointments can be set "At Home / Away"
An appointment belongs to two households when it is booked.
An appointment has a location (location of one of the households aka "At Home")
A user can check available appointments for all households in their family.
A household can join multiple families (maybe I should call families something like "Circle" so that it doesn't get confusing.)
A user can only belong to one household.
A household can belong to multiple families/circles
An appointment can belong to up to two households. When an appointment is booked, it becomes a "Visit" aka "Eid Didani"
An Eid Didani can have photos. In a later version this can become like a social media type app where users can share their eid didanis
