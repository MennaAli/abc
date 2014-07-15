require 'rails_helper'

describe User do

before {@user = user.new(name: "", email: "")}
subject{ @user }

it{ should respond_to(:name) }
it{ should respond_to(:email) }

it{ should be_valid }
describe "when name is not present" do #strting from this line and for the next 2 lines this tests the validation of name in user.rb
	before{ @user.name = " " }
	it { should_not be valid }
end
describe "when name is too long" do 
	before{ @user.name = "a" * 40 }
	it { should_not be valid }
end



describe "when email is not present" do 
	before{ @user.email = " " }
	it { should_not be valid }

end
describe "when email format is invalid" do 
	it { should be_invalid } do
	addresses = %w[user@hot,com user_at_hot.com examplr.user@hot.] # an array that has the invalid emails
	addresses.each do |invalid_address|
		@user.email = invalid_address #di zay or assigning the email to the invalid email?????????????????????????????????????
		@user.should_not be_valid
	end
end 
end
	describe "when email format is valid" do 
	it { should be valid }
	addresses = %w[user@hot.com A-USER@f.b.org menna.x@hot.jp c+a@bar.cn] # an array that has the valid emails
	addresses.each do |valid_address|
		@user.email = valid_address 
		@user.should be_valid
	end
end
describe "when email is already taken" do 
  before do
  	User_with_same_email = @user.dup # taking  a copy from the @user 
  	User_with_same_email.email = @user.email.upcase #assigning the new user with the email of @users in uppercase to be invalid???????????????????????????????????
  	User_with_same_email.save #this new user is the one i am going to check on it 
  end
  it { should be_invalid }
end
end
describe "when password_confirmation is not present" do 
	before{ @user.password_confirmation = " " }
	it { should_not be valid }

end
describe "when password is not present" do 
	before{ @user.password = " " }
	it { should_not be valid }

end
describe "when password is too long" do 
	before{ @user.password = "a" * 40 }
	it { should_not be valid }
end

end