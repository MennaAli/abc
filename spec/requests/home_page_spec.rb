require 'rails_helper'

RSpec.describe "Home Page", :type => :request do
 
  	describe "Home Page" do
  		it "should have the h1 'Our Demo App'" do #this is the url
  		#it "should have the content 'This is the home page'" do
  			visit '/home_page/home' # the link for visiting the page
  			page.should have_content('Our Demo App')#url
  			page.should have_content('This is the home page')
  			page.should have_selector('h1', :text => 'Our Demo App') # it's optional according to what's written in <h1>/<h1> in the home.html.erb(it is changeable)
        expect(page).to have_title('Demo App | Home')#it is unchangeable
 end 			
end 
  	describe "about page" do
  		it "should have the h1 'About us'" do
  		  visit '/home_page/about'
  			page.should have_content('About us')#the url
  			page.should have_content('This is the about page')#description
  			page.should have_selector('h1', :text => 'About us') # to make what's inside h1 is the url
  			expect(page).to have_title('Demo App | About Us')
      end
  end
end
