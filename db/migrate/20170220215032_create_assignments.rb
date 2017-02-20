class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.integer :point_value
      t.references :course, foreign_key: true

      t.timestamps null: false
    end
  end
end
