require 'rails_helper'

describe User do

before do 
	@user = User.new(name: "Menna", email: "menna@hotmail.com", password: "abcdefgh" ,password_confirmation: "abcdefgh")
end
subject{ @user }

it{ should respond_to(:name) } 
it{ should respond_to(:email) }
it{ should respond_to(:password_digest) }#this makes the password and password confirmation
it{ should respond_to(:password) }
it{ should respond_to(:password_confirmation) }
it{ should respond_to(:remember_token) }
it{ should respond_to(:admin) }
it{ should respond_to(:microposts) }
it{ should_not be_admin }






describe "when name is not present" do #strting from this line and for the next 2 lines this tests the validation of name in user.rb
	before{ @user.name = " " }
	it { should_not be_valid }
end

describe "when name is too long" do 
	before{ @user.name = "a" * 41 }
	it { should_not be_valid }
end



#describe "when email is not present" do 
	#before{ @user.email = " " }
	#it { should_not be_valid }

#end
describe "when email format is invalid" do 
	it " should be_invalid" do
		addresses = %w[user@hot,com user_at_hot.com examplr.user@hot.] # an array that has the invalid emails
		addresses.each do |invalid_address|
			@user.email = invalid_address 
			@user.should_not be_valid
		end
	end
 
end
describe "when email format is valid" do 
	it " should be valid " do
	addresses = %w[user@hot.com A-USER@f.b.org menna.x@hot.jp c+a@bar.cn] # an array that has the valid emails
	addresses.each do |valid_address|
		@user.email = valid_address 
		@user.should be_valid #or l agdad expect(@user).to be_valid
	end
	end
end
describe "when email is already taken" do 
  before do
  	User_with_same_email = @user.dup # taking  a copy from the @user 
  	User_with_same_email.email = @user.email.upcase 
  	User_with_same_email.save #this new user is the one i am going to check on it 
  end
  it " should_not be_valid " do
  	expect(@user).not_to be_valid
  end
end
describe "when password_confirmation is not present" do 
	before{ @user.password_confirmation = " " }
	it { should_not be_valid }

end
describe "when password is not present" do 
	before{ @user.password = @user.password_confirmation =  " " } 
	it { should_not be_valid }
end

describe "when password is too small" do 
	before{ @user.password = @user.password_confirmation = "a" * 7 } 
	it { should_not be_valid }
end


describe "when password is not present" do #strting from this line and for the next 2 lines this tests the validation of name in user.rb
	before{ @user.password = @user.password_confirmation = " " } 
	it { should_not be_valid }
 end
 describe "when password doesn't match the confirmation password" do
 	before{ @user.password_confirmation = "mismatch" }
 	it { should_not be_valid }
    end 
  describe "when  confirmation password is nil" do
 	before{ @user.password_confirmation = nil }
 	it { should_not be_valid }
 end

  describe "remember token" do
     before { @user.save } 
     it "should have a nonbalank remember token" do
     	
 	 end
  end
   describe "micropost association"

   before { @user.save}
   let!(:older_micropost) do
   	FactoryGirl.create(:micropost, user: @user , created_at: 1.day.ago)

   end
    let!(:newer_micropost) do
     FactoryGirl.create(:micropost, user: @user , created_at: 1.hour.ago)

      end

    it "should have the right microposts in the right order" do
     @user.microposts.should == [newer_misropost, older_micropost]
    end
     it "should destroy associated microposts" do
     	microposts = @user.microposts
     	@user.destroy
     	microposts.each do |micropost|
     		Micropost.find_by_id(micropost.id).should be_nil

     	end

     end
end
