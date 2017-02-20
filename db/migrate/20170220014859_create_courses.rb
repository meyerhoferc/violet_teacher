class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.references :subject, foreign_key: true
      t.string :title
      t.string :description
      t.string :location
      t.references :teacher, foreign_key: true

      t.timestamps null: false
    end
  end
end
