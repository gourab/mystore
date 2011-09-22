class CreateLineitems < ActiveRecord::Migration
  def self.up
    create_table :lineitems do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
      t.decimal :price ,:precision => 11 , :scale=> 2
      t.string  :status
      t.string  :item_no
      t.timestamps
    end
  end

  def self.down
    drop_table :lineitems
  end
end
