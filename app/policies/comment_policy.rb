# frozen_string_literal: true

class StudentPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    user.administrador? || user.colaborador?
  end
end
