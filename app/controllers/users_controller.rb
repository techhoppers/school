class UsersController < ApplicationController

layout "admin"
before_filter :set_params_filter, :only => [:create, :update]
before_filter :get_user, :only => [:edit, :update, :destroy]
before_filter :is_authorized, :only => [:edit, :update, :destroy]

def index
	@user_type = params['user_type']
  @tab = @user_type
	if @user_type
    @users = User.where(:role => "#{@user_type.upcase}")
    else
    @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(@filter_params)
    @user.set_default_password
    if @user.valid?
      @user.save
      flash[:notice] = "User Created Successfully!"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit

  end

  def destroy
    @user.destroy!
    flash[:notice] = "User Deleted Successfully!"
    redirect_to users_path
  end

  def update
    if @user.update_attributes(@filter_params)
      flash[:notice] = "User Details Updated Successfully"
      redirect_to users_path
    end
  end

  private

  def set_params_filter
    @filter_params = params.require(:user).permit(:first_name, :last_name, :email, :phone1, :phone2, :role)
  end

  def get_user
    @user = User.find(params[:id])
  end

   def is_authorized
    if !current_user.is_admin? && current_user != @user
      flash[:notice] = "Sorry!! UnAuthorized Access."
      redirect_to root_path
    end
  end
end
