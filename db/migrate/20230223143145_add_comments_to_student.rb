class AddCommentsToStudent < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :student
  end
end
