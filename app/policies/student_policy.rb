# frozen_string_literal: true

class StudentPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.set_validation_options
  end

  def show?
    user.set_validation_options
  end

  def create?
    user.set_validation_options
  end

  def new?
    create?
  end

  def update?
    @record.created_collab(user)
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
