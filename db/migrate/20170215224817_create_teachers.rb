class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :department
      t.string :username
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps
    end
  end
end
