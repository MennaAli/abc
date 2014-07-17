require 'rails_helper'

RSpec.describe "Users", :type => :request do
  	describe "Signup"
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
  describe "profile"
      visit /:id_path(user)

 it {should have_selector('h1', :text => user.name) }
        
 
 it {should have_selector('title' , :text => user.name) }
  end
  end 
 
