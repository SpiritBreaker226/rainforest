# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Product.destroy_all

User.create!({
	email: Faker::Internet.safe_email('Jim'),
	name: Faker::Name.name,
	password: "password",
	password_confirmation: "password"
})

100.times do
	Product.create([
		{ 
			name: Faker::Company.name,
			description: Faker::Company.bs << " " << Faker::Company.catch_phrase,
			price_in_cents: Faker::Number.number(4) 
		}
	])
end
