# frozen_string_literal: true

class UsersController < ApplicationController
  include Pundit
  before_action :set_user, only: [:edit, :update, :update_role]

  def index
    authorize User
    @presenter = UserPresenter.new(params)
    @pagy, @users = pagy(@presenter.users)
  end

  def new
    authorize User
    @user = User.new
  end

  # Register from modal
  def create
    authorize User
    @user = User.new(register_params)
    if @user.save
      redirect_to users_path, success: t('.created')
    else
      redirect_to users_path, warning: t('.not_created')
    end
  end

  def edit
    authorize User
  end

  def update
    authorize User
    if @user.update(register_params)
      redirect_to users_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy; end

  def toggle_active
    authorize User
    @user = User.find(params[:user_id])
    @user.active = params[:user][:active]
    if @user.save
      flash[:success] = t('.modified')
    else
      flash[:warning] = t('.not_modified')
    end
  end

  def update_role
    authorize User
    if @user.update(user_params)
      redirect_to users_path, notice: t('.updated')
    else
      redirect_to users_path, notice: t('.not_updated')
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end
end
