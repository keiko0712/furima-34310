class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code
      t.integer    :shipping_area_id
      t.string     :municipality  
      t.string     :address 
      t.string     :building_name
      t.string     :phone_number
      t.references :purchase_record
      t.timestamps
    end
  end
end
