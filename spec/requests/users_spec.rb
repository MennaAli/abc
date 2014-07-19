require 'rails_helper'

RSpec.describe "Users", :type => :request do
  	describe "Sign up" do
  		it "should have the content 'This is the sign up page!'" do 
  			visit signup_path
  			page.should have_content("This is the sign up page!")
  			
 end 	


 it "should have the h1 'Sign up'" do 
  			visit signup_path
  			
  			page.should have_selector('h1', :text => 'Sign up') 
        
 end 	

 it "should have the title 'Demo | Sign up'" do 
  			visit signup_path
  		
        expect(page).to have_title(full_title("Sign up"))
        
  end 	
end
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before{ visit user_path(user)}
     it { should have_selector('h1', :text => user.name) }
     it { should have_title(user.name) }
  end

 describe "signup" do
  before { visit signup_path } 

  let(:submit) { "Create my account" }
  describe "for invalid information" do
    it "should not create a user" do

      expect { click_button submit }.not_to change(User, :count)
    end
  end
    describe "for valid information" do
      before do
      fill_in "Name" ,          with: "Menna"
      fill_in "Email" ,         with: "Menna@you.com"
      fill_in "Password" ,      with: "foobar"
      fill_in "Confirmation" ,  with: "foobar"
      end
    it "should  create a user" do 
     expect { click_button submit }.not_to change(User, :count).by(1)
    end
     
    describe "after submisssion" do
      before { click_button submit }
        it { should have_title('title', text: 'Sign up')}
        it { should have_content('error')}

    end


    describe "after saving a user" do
       before { click_button submit }
      let(:user) { User.find_by_email("Menna@you.com") }
      it { should have_title(user.name) }
      it { should have_selector('div.alert.alert_success', text: 'welcome') }
      it { should have_link('Sign out') }

   end

  end


  end 
end
 
