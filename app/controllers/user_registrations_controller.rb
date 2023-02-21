# frozen_string_literal: true

class UserRegistrationsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  # Register a new user
  def create
    @user = User.new(register_params)
    if @user.save
      auto_login(@user)
      redirect_to users_path, notice: t('.welcome')
    else
      redirect_to register_path, warning: t('.error')
    end
  end

  private

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
