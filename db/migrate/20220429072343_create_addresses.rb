class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,  null: false
      t.integer    :province_id,  null: false, default: 1
      t.string     :city,         null: false
      t.string     :house_number, null: false
      t.string     :building
      t.string     :phone_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
