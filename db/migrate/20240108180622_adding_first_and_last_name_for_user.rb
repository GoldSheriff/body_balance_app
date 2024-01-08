class AddingFirstAndLastNameForUser < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.string :last_name
      t.string :first_name
    end
  end
end
