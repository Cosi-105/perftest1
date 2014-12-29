require 'faker'
10000.times do 
  People.create(name: Faker::Name.name, 
                city: Faker::Address.city,
                country: Faker::Address.country,
                random: Faker::Number.number(6)
                )
end
