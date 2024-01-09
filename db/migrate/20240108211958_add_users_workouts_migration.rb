class AddUsersWorkoutsMigration < ActiveRecord::Migration[7.1]
  def change
    create_table :users_workouts, id: false do |t|
      t.belongs_to :user
      t.belongs_to :workout
    end
  end
end
