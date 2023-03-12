class CreateAsists < ActiveRecord::Migration[7.0]
  def change
    create_table :asists do |t|
      t.references :student, null: false, foreign_key: true
      t.integer :asist, null: false, default: 0
      t.timestamps
    end
  end
end
