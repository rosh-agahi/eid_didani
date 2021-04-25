notes:

surge.sh -- free web hosting
corneal -- gem for developing new skeleton for sinatra app (specifically for learn.co)
  corneal new name_of_app
# Eid Didani

## Description
This is an app designed to help organize Persian Nowruz Eid Didanis!
Those who participate are familiar with the long drives, showing up to a house only to find that your relatives are also out at their eid didanis, and the desperate need to find a restroom after drinking wayyyy too much tea at your auntie's house.

### Models

#### Users
* attributes:
* belongs to only one Household
* belongs to one or more Families through Households

#### Households
* attributes:
* has many users (aka household members)
* belongs to multiple Families (or Circles)
* has many Appointments
* has many Visits
* has an address aka location

#### Family
* attributes:
* has many households

#### Appointments / Visits
* attributes:
* Appointment = not booked
  * while the appointment has not yet been booked, it only belongs to one household.
* Visit = booked (aka no longer available to book)
  * attributes
  * After the appointment has been book, it is called a "Visit."
  * A visit belongs to two households
  * A visit inherits the location of the hosting household.

## Sinatra Application flow

A user creates a profile. <br>
A user joins their household. <br>
A user, through their household, joins a family group. <br>
A user sets their family's available appointments. <br>
Appointments can be set "At Home / Away" <br>
An appointment belongs to two households when it is booked. <br>
An appointment has a location (location of one of the households aka "At Home") <br>
A user can check available appointments for all households in their family. <br>
A household can join multiple families (maybe I should call families something like "Circle" so that it doesn't get confusing.) <br>
A user can only belong to one household. <br>
A household can belong to multiple families/circles <br>
An appointment can belong to up to two households. When an appointment is booked, it becomes a "Visit" aka "Eid Didani" <br>
An Eid Didani can have photos. In a later version this can become like a social media type app where users can share their eid didanis

## Views

### Forms
* <strong>[NEW USER]</strong> intake form for new user
  * [NEW HOUSEHOLD]</strong> if a user is the first of their household to join, the user creates a new household
* <strong>[]</strong>
* <strong>[]</strong>
* <strong>[]</strong>
* <strong>[]</strong>
* <strong>[]</strong>
* <strong>[]</strong>
