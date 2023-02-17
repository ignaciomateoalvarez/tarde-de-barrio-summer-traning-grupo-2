class RemoveCreateByToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :created_by, :integer
  end
end
