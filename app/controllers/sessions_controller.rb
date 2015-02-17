class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      flash[:success] = "Successfully logged in"
      log_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Logged out"
    redirect_to root_path
  end
end
