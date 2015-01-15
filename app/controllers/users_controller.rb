class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if current_user.admin?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :image, :admin))
      flash[:success] = "User Updated"
      redirect_to "/users"
    else
      render 'edit'
    end
  end

end
