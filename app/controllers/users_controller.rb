class UsersController < ApplicationController
  def new
  	@user = User.new #3ashan mayeshta3'alsh 3ala nil user fel awel da ka2enni ba create user yeshta3'al 3aleh
  end
  def show
  	@user = User.find(params[:id])
  end
   def create
   	@user = User.new(user_params)
   	if @user.save
      sign_in @user
   		flash[:notice] = "User successfully created"
   		redirect to @user
   	else
  		render 'new' 
  	end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
