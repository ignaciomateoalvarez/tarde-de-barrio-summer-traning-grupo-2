class UserFilter
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :full_name, :string

  attr_reader :user

  def initialize(scope, params)
    super(params)
    @user = scope
  end

  def call
    by_name!
    @user
  end

  def by_name!
    return if full_name.blank?

    @user = user.where('first_name ILIKE :name OR last_name ILIKE :name', name: "%#{full_name}%")
                .or(user.where("first_name || ' ' || last_name ILIKE :name", name: "%#{full_name}%"))
                .or(user.where("last_name || ' ' || first_name ILIKE :name", name: "%#{full_name}%"))
  end
end
