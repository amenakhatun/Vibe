class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to root_url
    else
      render "new"
    end
  end

  def edit

    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    if @user.save
      redirect_to user_path(current_user)
    else
      render "edit"
    end

    @user = User.find_by(params[:id])

  end

  private


  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :region)
  end
end
