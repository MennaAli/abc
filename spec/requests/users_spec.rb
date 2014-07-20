require 'rails_helper'

RSpec.describe "Users", :type => :request do

     subject { page }

     describe "index " do
      let(:user) { FactoryGirl.create(:user) }


      before(:all) { 5.times { FactoryGirl.create(:user) }}
      after(:all) { User.delete_all }
      before(:each) do
        sign_in user
         #5.times { FactoryGirl.create(:user) }
          visit users_path
        end
        it { should have_title('All users') }
         it { should have_selector('h1' ,text: 'All users') }



         describe "pagination" do

          it { should have_selector('div.pagination') }
         end

         describe "delete links" do

           it { should have_link('delete') }

           describe "as an admin user" do

             let(:admin) { FactoryGirl.create(:admin)}
             before do
              sign_in  admin
              visit users_path
             end
             it { should have_link('delete', href: user_path(User.first)) }
              it "should be able to delete another user" do
                expect { click_link('delete') }.to change (User, :count).by
              end
           end
         end


         it "should list each user " do
         User.paginate(page: 2).each do |user|

           page.should have_selector('li>a', :text => user.name)
         end

          end
    


          end




  	describe "Sign up page" do
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

    before{ visit user_path(user) }
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
        within("form#new_user") do
      fill_in "Name" ,          with: "Menna"
      fill_in "Email" ,         with: "menna@you.com"
      fill_in "Password" ,      with: "foobar"
      fill_in "Confirmation" ,  with: "foobar"
      end
    
    it "should  create a user" do 
     expect { click_button submit }.not_to change(User, :count)
    end
     


    describe "after submisssion" do
      before { click_button submit }
        it { should have_title('Sign up')}
        it { should have_content('error')}

    end


    describe "after saving a user" do
       before { click_button submit }
      let(:user) { User.find_by_email("menna@you.com") }
      it { should have_title(user.name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out') }

   end
end
  end


  end

   describe "edit" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
         visit edit_user_path(user)
      end



      describe "update page" do
        before { visit edit_user_path(user) }
        it { should have_selector('h1', text: "Update your profile") }
        it { should have_title("Edit user") }
        it { should have_link('change' , href: 'http://gravatar.com/emails') }
      

    describe "with invalid information "  do
      before { click_button "Save changes"}
      it { save_and_open_page; should have_content('error') }
   end

    describe " with valid information " do
       let(:new_name) { "New name" }
       let(:new_email) { "new@example.com" }

        before do
          fill_in "Name",              with: new_name
          fill_in "Email",             with: new_email
          fill_in "Password",          with: user.password
          fill_in "Confirm Password" , with: user.password
          click_button "Save changes"
        end
    it { should have_title(new_name) }
    it { should have_link('Sign out' , href: signout_path) }
     it { should have_selector('div.alert.alert-success', text: 'Profile updated') }
     specify { user.reload.name.should == new_name }
     specify { user.reload.email.should == new_email }
   end
   end
 end
end
     

