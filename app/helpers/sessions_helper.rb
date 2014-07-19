module SessionsHelper
	def signin(user)
     #sign the user in 
    cookies.permenant[:remember_token] = value: user.remember_token
    current_user = user
	end


	def current_user=(user)
		@current_user ||= user.find_by_remember_token(cookies[:remember_token])

	end	


	def signed_in?
      current_user.nil?
	end	
    

	def sign_out
		current_user = nil
     cookies.delete(:remember_token)
	end	


end
