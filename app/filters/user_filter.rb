# frozen_string_literal: true

class UserFilter
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :full_name, :string

  attr_reader :users

  def initialize(scope, params)
    super(params)
    @users = scope
  end

  def call
    by_name!
    @users
  end

  def by_name!
    return if full_name.blank?

    @users = users.where('first_name ILIKE :name OR last_name ILIKE :name', name: "%#{full_name}%")
                  .or(users.where("first_name || ' ' || last_name ILIKE :name", name: "%#{full_name}%"))
                  .or(users.where("last_name || ' ' || first_name ILIKE :name", name: "%#{full_name}%"))
  end
end
