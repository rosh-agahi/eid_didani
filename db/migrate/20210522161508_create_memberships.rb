class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.integer :household_id
      t.integer :family_id
    end
  end
end
