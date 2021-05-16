class CreateHouseholds < ActiveRecord::Migration[6.1]
  def change
    create_table :households do |t|
      t.string :name
      t.string :address
      t.integer :admin_id
    end
  end
end
