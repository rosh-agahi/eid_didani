# users
# attributes: name, email, password, household_id

User.create(name:"Annie", email:"anni@r.co", password: "test")
User.create(name:"Mom", email:"nilu@amco.co", password: "test")
User.create(name:"Dad", email:"sooagi@g.co", password: "test")
User.create(name:"Amo Fred", email:"farh@ag.co", password: "test", household_id: 2)
User.create(name:"Tara Ag", email:"taga@ag.co", password: "test", household_id: 2)
User.create(name:"Khaleh Simi", email:"simi@ag.co", password: "test", household_id: 2)
User.create(name:"Anna Khahar", email:"a.a@gma.como", password: "test", household_id: 3)
User.create(name:"Roroo", email:"roroo@gma.co", password: "test", household_id: 3)

# households
# attributes: name, address, admin_id

Household.create(name:"Farhad, Arcadia", address:"1836 Stuartevant Ave, Arcadia, CA", admin_id: 4)
Household.create(name:"Anna in Playa", address:"1145 BeachCove Dr, Playa, CA", admin_id: 7)
#
# # availabilities
# # attributes: household_id, datetime, status (Boolean)
#
Availability.create(household_id: 2, available_date: "2022-03-22 01:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-22 03:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-22 01:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-22 02:00:00 UTC", available_status: true)

# families
# attributes: name,
# Family.create()
