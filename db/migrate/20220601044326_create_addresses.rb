class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :pincode
      t.string :state
      t.string :country
      t.string :landmark
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
