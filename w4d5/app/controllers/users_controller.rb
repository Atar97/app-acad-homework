class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def index
    @users = User.all
    render :index
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'shared/errors'
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
