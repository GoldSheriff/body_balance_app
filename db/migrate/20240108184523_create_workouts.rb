class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :descriprtion

      t.timestamps
    end
  end
end
