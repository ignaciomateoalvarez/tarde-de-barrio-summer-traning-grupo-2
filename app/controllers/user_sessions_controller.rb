# frozen_string_literal: true

class UserSessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new; end

  #User login
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.active?
        if login(params[:email], params[:password])
          redirect_to users_path, notice: "#{t('welcome')} #{@user.first_name}"
        else
          redirect_to login_path, alert: t('.incorrect_info')
        end
      else
        redirect_to login_path, alert: t('.user_disabled')
      end
    else
      redirect_to login_path, alert: t('.incorrect_info')
    end
  end

  def destroy
    logout
    redirect_to(root_path)
  end
end
