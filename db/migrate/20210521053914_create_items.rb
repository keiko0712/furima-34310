class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                       null: false
      t.text       :description_of_item,        null: false
      t.integer    :price,                      null: false
      t.references :user,                       null: false, foreign_key: true
      t.integer    :category_id ,               null: false
      t.integer    :item_status_id,             null: false
      t.integer    :delivery_charge_id,         null: false
      t.integer    :shipping_area_id,           null: false
      t.integer    :estimated_shipping_date_id, null: false

      t.timestamps
    end
  end
end
