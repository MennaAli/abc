class SessionsController < ApplicationController
	
	def create
		user = User.find_by_email(params[:session][:email]) #get the user from his email
		if user && user.authenticate(params[:session][:password])   #hacheck da valid password l user mawgood
		 sign_in user #this method should be identified in session helpers
		 redirect_back_or user # lel profile beta3to??????
		else
		flash[:error] = "Invalid email/password combination"
		redirect_to :back
	     end
	end
	def destroy
		sign_out
		redirect_to root_path
	end
end
