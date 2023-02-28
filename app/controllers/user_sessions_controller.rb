# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    redirect_to students_path if current_user
  end

  #User login
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.active?
        if login(params[:email], params[:password], remember_me = params[:remember_me])
          if @user.administrador?
            redirect_back_or_to(users_path, success: "#{t('.welcome')} #{@user.first_name}")
          else
            redirect_back_or_to(students_path, success: "#{t('.welcome')} #{@user.first_name}")
          end
        end
      else
        redirect_to login_path, warning: t('.user_disabled')
      end
    else
      redirect_to login_path, warning: t('.incorrect_info')
    end
  end

  def destroy
    logout
    redirect_to(root_path)
  end
end