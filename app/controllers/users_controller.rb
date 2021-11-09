class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'Your account was successfully created'
    else
      flash[:error] = "User has errors"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated'
    else
      flash[:error] = "User has errors"
      render 'edit'
    end
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to users_path, notice: 'User was successfully deleted'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :city, :town, :password, :password_confirmation)
  end
end
