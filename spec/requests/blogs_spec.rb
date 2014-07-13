require 'rails_helper'
RSpec.describe "Blogs", :type => :request do

 
  	describe "Home Page" do
  		it "should have the content 'Hello, world!'" do 
  			visit root_path
  			page.should have_content("This is our blog's homepage.")
  			
 end 	

 it "should have the h1 'Hello, world!'" do 
  			visit root_path
  			
  			page.should have_selector('h1', :text => 'Hello, world!') 
        
 end 	

 it "should have the title 'Hello, world!'" do 
  			visit root_path
  		
        expect(page).to have_title('Demo')
 end 			
end 
  	
  	describe "About Page" do
  		it "should have the content 'About Us '" do 
  			visit about_path
  				page.should have_content('This is the about page')
  			
      end

      it "should have the h1 'About Us '" do 
  			visit about_path
  				
  			page.should have_selector('h1', :text => 'About Us') 
       
      end

      it "should have the title 'About Us '" do 
  			visit about_path
        expect(page).to have_title('Demo | About Us')
      end
  end
end