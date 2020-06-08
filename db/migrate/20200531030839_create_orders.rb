class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :shipping_fees, default: 800
      t.integer :payment_method
      t.integer :total_price
      t.integer :order_status, default: 1

      t.timestamps
    end
  end
end
