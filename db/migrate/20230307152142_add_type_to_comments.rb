class AddTypeToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :type, :string
  end
end
