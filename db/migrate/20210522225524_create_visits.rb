class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.integer :host_household_id
      t.integer :guest_household_id
      t.datetime :visit_date
    end 
  end
end
