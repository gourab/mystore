class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string  :order_no
      t.string  :first_name
      t.string  :last_name
      t.string  :city
      t.string  :address1
      t.string  :address2
      t.string  :zip_code, :limit => 12
      t.string  :state    
      t.string  :shipping
      t.decimal :sale_tax ,:precision => 11 , :scale=> 2
      t.decimal :shipping_charge ,:precision => 11 , :scale=> 2
      t.decimal :price ,:precision => 11 , :scale=> 2
      t.decimal :net_price , :precision => 11 , :scale=> 2
      t.boolean :payment_status , :default => false
      t.boolean :shipping_status , :default => false
      t.string  :transaction_id
      t.string  :email
     
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
