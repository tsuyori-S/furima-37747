class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :information,      null: false
      t.integer    :category_id,      null: false, default: 1
      t.integer    :state_id,         null: false, default: 1
      t.integer    :delivery_fee_id,  null: false, default: 1
      t.integer    :province_id,      null: false, default: 1
      t.integer    :delivery_time_id, null: false, default: 1
      t.integer    :price,            null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
