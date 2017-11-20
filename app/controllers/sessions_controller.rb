class SessionsController < ApplicationController

  def new
    @session
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      current_user = user
      redirect_to root_url
    else
      flash.now[:danger] = "Unvalid Sign In Credentials" 
      render 'new'
    end
  end

  def destroy
    sign_out current_user if is_signed_in?
    redirect_to root_url
  end
  
end
