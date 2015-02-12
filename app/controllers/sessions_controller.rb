class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:email], params[:session][:password])
      log_in(user)
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
      log_out
      redirect_to login_path
  end
end
