# users

User.create(name: "Sam A", email: "sami@gma.coco", password: "password1")
User.create(name: "Nilu A", email: "nil@gma.coco", password: "password2")
User.create(name: "Anna Khahar", email: "ann@gma.coco", password: "password3")
User.create(name: "Fred Ag", email: "fre@gma.coco", password: "password4", household_id: 1)
User.create(name: "Simi Ag", email: "sim@gma.coco", password: "password5", household_id: 1)
User.create(name: "Tia Ag", email: "tia@gma.coco", password: "password6", household_id: 1)
User.create(name: "David Ag", email: "dav@gma.coco", password: "password7", household_id: 2)
User.create(name: "Momma Ing", email: "mom@gma.coco", password: "password8", household_id: 2)
User.create(name: "Farhad Agi", email: "far@gma.coco", password: "password9", household_id: 3)
User.create(name: "Baghmeh Agi", email: "bag@gma.coco", password: "password10", household_id: 3)
User.create(name: "Nasrin Agi", email: "nas@gma.coco", password: "password11", household_id: 3)
User.create(name: "Rami", email: "ram@gma.coco", password: "password12", household_id: 4)
User.create(name: "Zari", email: "zar@gma.coco", password: "password13", household_id: 4)
User.create(name: "Reina", email: "rei@gma.coco", password: "password14", household_id: 4)
User.create(name: "Kiumarz A", email: "kiu@gma.coco", password: "password15", household_id: 5)
User.create(name: "Rusty A", email: "rus@gma.coco", password: "password16", household_id: 5)
User.create(name: "Frank A", email: "fra@gma.coco", password: "password17", household_id: 6)
User.create(name: "Jasmine A", email: "jas@gma.coco", password: "password18", household_id: 6)
User.create(name: "Bij A", email: "bij@gma.coco", password: "password19", household_id: 6)
User.create(name: "Ayla", email: "ayl@gma.coco", password: "password20", household_id: 7)
User.create(name: "Bobby", email: "bob@gma.coco", password: "password21", household_id: 7)
User.create(name: "Baba Agahi", email: "bab@gma.coco", password: "password22", household_id: 8)
User.create(name: "Ruby Ag", email: "rub@gma.coco", password: "password23", household_id: 8)

# households

Household.create(name: "Farhad, CaminoR", address: "1231 Camino Real, Acadia", admin_id: 4)
Household.create(name: "Leo's House", address: "1111 J St, Pasadena", admin_id: 7)
Household.create(name: "Farhad, Irvine", address: "123 Appletree Ave, Irvine", admin_id: 11)
Household.create(name: "Ramin&Zari", address: "8282 Bolyn Rd, Irvine", admin_id: 13)
Household.create(name: "Kiumarz A", address: "22 Gould St, #4, Anaheim", admin_id: 15)
Household.create(name: "Frank & Kids", address: "1993 Winterhouse Ln, Irvine", admin_id: 19)
Household.create(name: "Ayla + Bobby", address: "100 Colorado Blvd, San Bernardino", admin_id: 20)
Household.create(name: "Baba Agahi", address: "2021 Memory Lane, Mission Viejo", admin_id: 23)

# families

Family.create(name: "Agahis of OC", secret_join_code: "SuperAgahi", admin_id: 20)
Family.create(name: "Hassan&Jamileh's kids", secret_join_code: "HJ123", admin_id: 12)
Family.create(name: "TheRealMoghadami's", secret_join_code: "fake")
Family.create(name: "Nalbaki Network", secret_join_code: "NN")
Family.create(name: "Nanjoon's Grandkids", secret_join_code: "nanjoon!")
Family.create(name: "This Group Goes on CousinTrip", secret_join_code: "cousintrip!")
Family.create(name: "Jafaripours from PHX", secret_join_code: "PHX duh")
Family.create(name: "SS Soleimani", secret_join_code: "SHE")
Family.create(name: "Kesheh's Keshavarzi Fam", secret_join_code: "Keshavarz1")
Family.create(name: "Gholami", secret_join_code: "myprecious")

# memberships

Membership.create(household_id: 1, family_id: 1)
Membership.create(household_id: 2, family_id: 1)
Membership.create(household_id: 3, family_id: 2)
Membership.create(household_id: 4, family_id: 2)
Membership.create(household_id: 5, family_id: 2)
Membership.create(household_id: 6, family_id: 1)
Membership.create(household_id: 7, family_id: 1)
Membership.create(household_id: 8, family_id: 1)
Membership.create(household_id: 7, family_id: 6)
Membership.create(household_id: 2, family_id: 6)

# availabilities

Availability.create(household_id: 1, available_date: "2022-03-22 14:00:00 UTC", available_status: true)
Availability.create(household_id: 1, available_date: "2022-03-22 15:00:00 UTC", available_status: true)
Availability.create(household_id: 1, available_date: "2022-03-22 16:00:00 UTC", available_status: true)
Availability.create(household_id: 1, available_date: "2022-03-22 17:00:00 UTC", available_status: true)
Availability.create(household_id: 1, available_date: "2022-03-23 14:00:00 UTC", available_status: true)
Availability.create(household_id: 1, available_date: "2022-03-23 15:00:00 UTC", available_status: true)
Availability.create(household_id: 1, available_date: "2022-03-23 16:00:00 UTC", available_status: true)
Availability.create(household_id: 1, available_date: "2022-03-23 17:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-22 14:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-22 15:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-22 16:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-22 17:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-23 14:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-23 15:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-23 16:00:00 UTC", available_status: true)
Availability.create(household_id: 2, available_date: "2022-03-23 17:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-22 14:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-22 15:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-22 16:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-22 17:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-23 14:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-23 15:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-23 16:00:00 UTC", available_status: true)
Availability.create(household_id: 3, available_date: "2022-03-23 17:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-22 14:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-22 15:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-22 16:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-22 17:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-23 14:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-23 15:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-23 16:00:00 UTC", available_status: true)
Availability.create(household_id: 4, available_date: "2022-03-23 17:00:00 UTC", available_status: true)
