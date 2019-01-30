class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :subject
      t.string :day_of_week
      t.time :time_start
      t.time :time_end
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
