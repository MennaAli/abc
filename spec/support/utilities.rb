include ApplicationHelper

RSpec::Matchers.define :have_error_messages do |message|
 match do |page|

   it { should have_selector('div.alert.alert-error', text: 'Invalid') }
 end
end	

def sign_in(user)
	 visit root_path
	fill_in "Email"    ,with: user.email
    fill_in "Password" ,with: user.password
    click_button "Sign in"
    cookies[:remember_token] = user.remember_token

 end	