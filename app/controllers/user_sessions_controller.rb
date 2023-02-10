# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new; end

  #User login
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.active?
        if login(params[:email], params[:password])
          redirect_to users_path, notice: "Welcome! #{@user.email}"
        else
          redirect_to login_path, alert: 'Password or email is incorrect'
        end
      else
        redirect_to login_path, alert: 'User is disabled'
      end
    else
      redirect_to login_path, alert: 'Password or email is incorrect'
    end
  end

  def destroy
    logout
    redirect_to(root_path)
  end
end
