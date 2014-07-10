require 'rails_helper'

RSpec.describe "Conts", :type => :request do
  describe "GET /conts" do
  	describe "home page" do
  		it "should have the content 'This is the home page'" do
  			visit '/cont/home'
 end 			
end 
  	describe "about page" do
  		it "should have the content 'This is the About page'" do
  			visit '/cont/about'


end
end
