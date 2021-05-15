class CreateAvailabilites < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilites do |t|
      t.integer :household_id
      t.datetime :available_date
      t.boolean :available_status
    end
  end
end
