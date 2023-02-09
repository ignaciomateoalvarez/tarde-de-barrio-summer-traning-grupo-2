# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true
end
 