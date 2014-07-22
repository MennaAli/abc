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
it{ should respond_to(:posts) }
it{ should respond_to(:feed) }
it{ should respond_to(:relationships) }
it{ should_not be_admin }



describe "with admin attributes set to 'true'" do
	before { @user.toggle!(:admin) }
	it { should be_admin }

end


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
  	puts User_with_same_email.inspect
  	puts User_with_same_email.errors.inspect
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
   describe "post association" do

   before { @user.save}
   let!(:older_post) do
   	FactoryGirl.create(:post, user: @user , created_at: 1.day.ago)

   end
    let!(:newer_post) do
     FactoryGirl.create(:post, user: @user , created_at: 1.hour.ago)

      end

    it "should have the right posts in the right order" do
     @user.posts.should == [newer_post, older_post]
    end
     it "should destroy associated posts" do
     	posts = @user.posts
     	@user.destroy
     	posts.each do |post|
     		Post.find_by_id(post.id).should be_nil

     	end

     end
     describe "status" do
     	let(:unfollowed_post) { FactoryGirl.create(:post, user: FactoryGirl.create(:user)) }


        it "the newer post is included " do
        	expect(@user.feed).to include(newer_post)
        end
        it " the older post is included" do
         expect(@user.feed).to include(older_post)

        end

        it " the followed post is not included" do
            expect(@user.feed).not_to include(unfollowed_post)

        end
     end	
end
end
