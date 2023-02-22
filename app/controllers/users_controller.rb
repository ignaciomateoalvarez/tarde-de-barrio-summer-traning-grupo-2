# frozen_string_literal: true

class UsersController < ApplicationController
  include Pundit

  def index
    @presenter = UserPresenter.new(params)
    @pagy, @users = pagy(@presenter.users)
  end

  def new
    @user = User.new
  end

  # Register from modal
  def create
    @user = User.new(register_params)
    if @user.save
      redirect_to users_path, notice: t('.created')
    else
      redirect_to users_path, alert: t('.not_created')
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize User
  end

  def update
    authorize User
    @user = User.find(params[:id])
    if @user.update(register_params)
      flash[:notice] = t('.updated')
    else
      render :edit
    end
  end

  def destroy; end

  def toggle_active
    @user = User.find(params[:user_id])
    @user.active = params[:user][:active]
    if @user.save
      flash[:notice] = t('.modified')
    else
      flash[:alert] = t('.not_modified')
    end
  end

  def update_role
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: t('.updated')
    else
      redirect_to users_path, notice: t('.not_updated')
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end
end
