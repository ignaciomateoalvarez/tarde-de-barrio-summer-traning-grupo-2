class Students < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false, presence: true
      t.string :last_name, null: false, presence: true
      t.date :birth_date, null: false, presence: true
      t.string :address, null: false, presence: true
      t.integer :school_grade, null: false, default: 0, presence: true
      t.boolean :attends, default: false
      t.timestamps null: false
    end
  end
end
