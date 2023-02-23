class AddUserToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :user
  end
end
