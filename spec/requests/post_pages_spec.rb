require 'rails_helper'

RSpec.describe "Post Pages", :type => :request do

	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }
	describe "post creation" do
		before { visit root_path }

	describe "with invalid information" do
		it "should not create a post" do
			expect { click_button "Post"}.not_to change(Post, :count)
   end

     describe "error messages" do
     	before { click_button "Post" }
     	it { should have_content('error') }

       end
    end

   end	

   describe "post destruction" do
   	before { FactoryGirl.create(:post, user: user) }
   	describe "as correct user " do
   	before { visit root_path }

   	 describe "should delete a post" do
      it "delete" do
	    expect{ click_link "delete"}.to change(Post, :count).by(-1)
       end
   	 end


   	end	

   end	
 
end
