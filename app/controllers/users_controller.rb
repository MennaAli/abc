class UsersController < ApplicationController
    before_filter :signed_in_user , only: [:edit, :update ,:index]
    before_filter :correct_user , only: [:edit, :update]
    before_filter :admin_user , only: :destroy

  def new
  	@user = User.new #3ashan mayeshta3'alsh 3ala nil user fel awel da ka2enni ba create user yeshta3'al 3aleh
  end
  def index 
   @users = User.paginate(page: params[:page],:per_page=>5 )
  end


  def show
  	@user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end


   def create
   	@user = User.new(user_params)
   	if @user.save
      sign_in @user
      redirect_back_or user
   		flash[:notice] = "User successfully created"
   		redirect_to @user
   	else
  		render 'new' 
  	end
  end


   def edit

  end


  def update
     @user = User.find(params[:id])
     if @user.update_attributes(user_params)
      sign_in @user
      flash[:notice] = "Profile updated"
        redirect_to @user
     else
     render 'edit' 
     end
  end


  def destroy
     User.find(params[:id]).destroy
     flash[:notice] = "User destroyed"
      redirect_to users_path

    end



  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

   def correct_user
    @user = User.find(params[:id])
     redirect_to root_path   unless current_user?(@user)
   end


   def admin_user
    @user = User.find(params[:id])
     redirect_to root_path   unless current_user.admin
   end

end
