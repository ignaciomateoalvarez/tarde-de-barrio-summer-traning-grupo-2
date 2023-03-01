class Answers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :body, null: false, presence: true
      t.timestamps
    end
    add_reference :answers, :user
    add_reference :answers, :comment
  end
end
