# frozen_string_literal: true

class AddCreateByToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :created_by, :integer
  end
end
