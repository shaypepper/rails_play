class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/events"
    else
      flash[:errors] = user.errors
      redirect_to "/"
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    [:first_name, :last_name, :city, :email, :state].each do |field|
      user[field] = params[:user][field]
    end
    if user.save
      redirect_to "/events"
    else
      flash_errors user
      redirect_to :back
    end
    
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :state, :last_name, :city, :email, :password, :password_confirmation)
    end
end
