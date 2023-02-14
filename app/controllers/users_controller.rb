# frozen_string_literal: true

class UsersController < ApplicationController
  include Pundit

  def index
    @filter = UserFilter.new(User.all, filter_params)
    @user = @filter.call.order(:first_name)
    @pagy, @users = pagy(@user)
  end

  def filter_params
    params
      .fetch(:user_filter, {})
      .permit(:full_name)
  end

  def new
    @user = User.new
  end

  # Register from modal
  def create
    @user = User.new(register_params)
    if @user.save
      redirect_to users_path, notice: 'Created user successfully'
    else
      redirect_to users_path, alert: 'Could not create user'
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
      flash[:notice] = 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy; end

  def toggle_active
    @user = User.find(params[:user_id])
    @user.active = params[:user][:active]
    if @user.save
      flash[:notice] = 'Estado modificado'
    else
      flash[:alert] = 'No pudo ser modificado'
    end
  end

  def update_role
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'Rol actualizado'
    else
      redirect_to users_path, notice: 'hubo un problema'
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
