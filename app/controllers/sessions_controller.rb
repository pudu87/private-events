class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully!"
      redirect_to root_path
    else
      flash.now[:alert] = "Name not in database."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out."
    redirect_to root_path
  end

end
