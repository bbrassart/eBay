class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to '/login'
    end
  end

  def new
  end

  def delete
    session.clear
    redirect_to users_path
  end
end
