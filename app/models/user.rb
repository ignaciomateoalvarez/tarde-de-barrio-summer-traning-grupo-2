# frozen_string_literal: true

class User < ApplicationRecord
  has_many :students

  authenticates_with_sorcery!
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true
  enum role: %i[administrador colaborador]
  before_validation :set_default_role, on: :create
  attr_accessor :created_by

  def set_validation_options
    administrador? || colaborador?
  end

  private

  def set_default_role
    # Hacemos a todos admin para el deploy
    self.role ||= :administrador
  end
end
