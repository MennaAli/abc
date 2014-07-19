require 'rails_helper'

describe "Authentication pages" do
	
	subject{ page }
	describe "Signin page " do
   before{ visit signin_path }
   it { should have_selector('h1', text: 'Sign in') }
    it { should have_title('title', text: 'Sign in') }
    end


describe "sign in" do
	before{ visit signin_path }

	describe "with invalid information"
	   before{ click_button "Sign in"}
	   it { should have_title('title', text: 'Sign in') }
	   it { should have_selector('div.alert.alert-error', text: 'Invalid') }

          describe "after visiting another page "
          before{ click_link "Home"}
           it { should_not have_selector('div.alert.alert-error') } # to make this page disappear
           end
    end

    describe "with valid information "
    let("user") {FactoryGirl.create(:user) }
    before do
    	fill_in "Email"    ,with: user.email
    	fill_in "Password" ,with: user.password
         click_button "Sign in"
    end
      it { should have_title('title', text: user.name) } 
      it { should have_link("Profile",     href: user_path(user) } 
      it { should have_link("Settings",    href: signout_path) }
      it { should_not have_link("Sign in", href: signin_path) }

      describe "followed by signout" do
      	before{ click_button "Sign out"}


    end
  end
end