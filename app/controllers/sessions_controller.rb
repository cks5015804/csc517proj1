class SessionsController < ApplicationController
  include SessionsHelper

  def new
    if logged_in?
      redirect_to projects_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:email], params[:session][:password])
      log_in(user)
      redirect_to projects_path
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def password

  end

  def password_change
    @user = current_user
    if @user.password == params[:session][:password_old]
      @user.update({:password => params[:session][:password]})
      redirect_to users_path, notice: 'Password changed successfully'
    else
      flash.now[:danger] = 'Incorrect password. Please try again'
      render 'password'
    end
  end

  def destroy
      log_out
      redirect_to login_path
  end
end
