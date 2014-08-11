class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if user.save
      redirect_to users_path, notice: "Signed Up!"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:email, :password, :password_confirmation))
      redirect_to users_path, notice: "#{@user.email} successfully changed"
    else
      render 'edit'
    end
  end

  def destroy
    u = User.find_by(id: params[:id])
    if u.destroy
      redirect_to users_path, notice: "#{u.email} removed forever"
    end
  end

end
