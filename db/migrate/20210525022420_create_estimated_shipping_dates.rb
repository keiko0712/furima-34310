class CreateEstimatedShippingDates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimated_shipping_dates do |t|

      t.timestamps
    end
  end
end
