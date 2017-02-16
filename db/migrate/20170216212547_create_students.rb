class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :username
      t.integer :grade
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
