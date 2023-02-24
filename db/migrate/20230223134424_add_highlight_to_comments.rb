class AddHighlightToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :highlight, :boolean
  end
end
