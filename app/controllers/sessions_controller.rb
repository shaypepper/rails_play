class SessionsController < ApplicationController
  def index
  end
  def login
    @user = User.find_by_email(params[:email])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to "/"
    end
  end
  def logout
    session.clear
    redirect_to "/"
  end
end
