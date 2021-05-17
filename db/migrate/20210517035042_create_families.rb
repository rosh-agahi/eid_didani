class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :name
      t.string :secret_join_code
      t.integer :admin_id
    end
  end
end
