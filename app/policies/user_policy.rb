# frozen_string_literal: true

class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.administrador?
  end

  def show?
    false
  end

  def create?
    user.administrador?
  end

  def new?
    create?
  end

  def update?
    user.administrador?
  end

  def toggle_active?
    user.administrador?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def logged?
    user.is_logged?
  end
end
