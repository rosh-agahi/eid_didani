class AddToAvailabilities < ActiveRecord::Migration[6.1]
  def change
    add_column :availabilities, :other_household_id, :integer
    add_column :availabilities, :role, :string
  end
end
