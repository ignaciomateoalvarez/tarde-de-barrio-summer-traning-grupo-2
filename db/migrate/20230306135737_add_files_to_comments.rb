class AddFilesToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :files, :json
  end
end
