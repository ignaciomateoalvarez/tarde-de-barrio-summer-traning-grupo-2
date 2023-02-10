# frozen_string_literal: true

class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.administrador? # || record.created_by == user.id (Este policy hace que un colaborador solo pueda editar a un usuario creado por el)
  end

  def toggle_active?
    # user.admin? && !record.admin? (Lo pedia el ejercicio, pero no tenemos la creada la relacion de administradores a colaboradores.) Lo que hace este Policy es permitir que solo los administradores puedan deshabilitar a los colaboradores.
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
