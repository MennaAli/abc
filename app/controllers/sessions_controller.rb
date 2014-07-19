class SessionsController < ApplicationController
	def new 
	end
	def create
		user = User.find_by_email(params[:session][:email]) #get the user from his email
		if user && user.authenticate(params[:session][:password])   #hacheck da valid password l user mawgood
		 sign_in user #this method should be identified in session helpers
		 redirect to user # lel profile beta3to??????
		else
		flash.now[:error] = "Invalid email/password combination"
		render 'new'
	     end
	end
	def destroy
		sign_out
		redirect_to root_path
	end
end
