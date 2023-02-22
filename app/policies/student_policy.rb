# frozen_string_literal: true

class StudentPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.administrador? || user.colaborador?
  end

  def show?
    user.administrador? || user.colaborador?
  end

  def create?
    user.administrador? || user.colaborador?
  end

  def new?
    create?
  end

  def update?
    user.administrador? || record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    user.administrador? || record.user == user
  end
end
