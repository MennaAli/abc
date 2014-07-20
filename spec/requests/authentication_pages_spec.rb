require 'rails_helper'

describe "Authentication pages" do
	
	subject{ page }



describe "sign in" do
	before{ visit root_path }

	describe "with invalid information" do
	   before{ click_button "Sign in"}
	   it { should have_selector('div.alert.alert-danger', text: 'Invalid') }

          describe "after visiting another page " do
          before{ click_link "About Us"}
           it { should_not have_selector('div.alert.alert-danger') } # to make this page disappear
           end
    end

    describe "with valid information " do
    let(:user) {FactoryGirl.create(:user) }
    before { sign_in user }
    
      it { should have_title(user.name) } 
      it { should have_link("Profile",     href: user_path(user)) } 
      it { should have_link("Sign out",    href: signout_path) }
      it { should have_link("Settings",    href: edit_user_path(user)) }
       it { should have_link("Users",    href: users_path) }
      it{ should_not have_css('form.signin') }

      describe "followed by signout" do
      	before{ click_link "Sign out"}
      	it{ should have_css('form.signin') }
	  end
  end
end

    describe "Authorization" do
       describe "for non_signed_in users" do
           
       	   let(:user) {FactoryGirl.create(:user) }
         describe "when attempting to visit a protected page" do

         	before do
               visit edit_user_path(user)
                fill_in "Email",       with: user.email
                fill_in "Password",      with: user.password
                click_button "Sign in"

             end

             describe "after signing in " do
                 it "should render the desired protected page" do
                	 page.should have_title('Edit user')
             	 end 

              
                describe  "when signing in again " do 
                  before do
                  	#click_button "Sign in"
                   click_link "Sign out"
                     fill_in "Email",       with: user.email
                     fill_in "Password",      with: user.password
                     click_button "Sign in"
                   end

               it "should render the default(profile) page" do
                      page.should have_title(user.name)
                 end 
              end  	

             end
          end



          describe " in the users controller " do
               describe " visiting the edit page " do
                    before{ visit edit_user_path(user) }
                 
                    it { should have_selector('div.alert.alert-danger') }
                end
               describe " submitting to the update action" do
               	before{ put user_path(user)}
               	specify { response.should redirect_to(root_path)}

           end

            describe " visiting the user index" do
            	before{ visit users_path }
            	#it { should have_title('Sign in') } 


             end
        end

    end
    describe "as wrong user" do
     	let(:user) { FactoryGirl.create(:user) }
     	let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }

     	before { sign_in user}

     	describe "visiting user  edit page " do
           before { visit edit_user_path(wrong_user) }
         it { should_not have_title('Edit user') } 


     	end
        describe "submitting a put request to the users update action " do

        	before { put user_path(wrong_user)}
        	specify { response.should redirect_to(root_path)}
        end  	
    end 


    describe " as non admin user" do
       let(:user) { FactoryGirl.create(:user) }
       let(:non_admin) { FactoryGirl.create(:user) }

       before { sign_in non_admin}

       describe " submitting a delete request to the users destroy action" do
            before { delete user_path(user) }
            specify { response.should redirect_to(root_path) }


       end
    end	
    end

end