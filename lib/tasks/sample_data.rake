namespace :db do
	desc "fill database with sample data "
	task populate: :environment do
		admin=User.create(name: "Menna", 
			        email: "menna@hop.com " ,
			        password: "foobar", 
			        password_confirmation: "foobar")

		admin.toggle!(:admin)

		99.times do |n| 
			name = Faker::Name.name
			email = "example-#{n+1}@hop.com"
			password = "password"
			User.create!(name: name, email: email , password: password, password_confirmation: password)


		end
	end
end
