class UsersController < ApplicationController

layout "admin"

before_filter :set_division
before_filter :set_params_filter, :only => [:create, :update]
before_filter :get_user, :only => [:edit, :update, :destroy]
#before_filter :is_authorized, :only => [:edit, :update, :destroy]

before_filter :check_for_cancel, :only => [:create, :update]
before_filter :get_division_students, :only => [:index]

def index
	@user_type = params['user_type']
  if @user_type
    @users = User.where(:role => "#{@user_type.upcase}").where.not(:id => @ids)
  else
    @users = User.all
  end
end

  def new
    @user = User.new
    @user.role = params[:user_type].upcase
    puts @user.inspect
  end

  def create
    @user = User.new(@filter_params)
    @user.set_default_password
    if @user.valid?
      @user.save
      send("create_#{@user.role.downcase}_user".to_sym)
      flash[:notice] = "User Created Successfully!"
      redirect_to users_path(:user_type => @user.role)
    else
      render :new
    end
  end

  def edit

  end

  def destroy
    user_type = @user.role
    @user.destroy!
    flash[:notice] = "User Deleted Successfully!"
    redirect_to users_path(:user_type => user_type)
  end

  def update
    if @user.update_attributes(@filter_params)
      flash[:notice] = "User Details Updated Successfully"
      redirect_to users_path(:user_type => @user.role)
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
  
  def check_for_cancel
    if params[:commit] == "Cancel"
    end
  end
 
  def set_division
    @division = nil
    if params['division'].present?
      session[:division] = Division.find(params[:division])
    end
    @division ||= session[:division]
  end
  
  def get_division_students
    @ids = []
    if @division.present?
      @tab = "academic"
      @ids = StudentDivision.select("DISTINCT(student_id)").where(:division_id => @division.id)
    end
  end
  
  def create_student_user
    st_div = StudentDivision.new
    st_div.student_id = @user.id
    st_div.division_id = @division.id
    st_div.save
  end
  
end
