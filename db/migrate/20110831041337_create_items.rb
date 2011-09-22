class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column :title,                    :string, :limit => 40
      t.column :price,                    :double
      t.column :quantity,                 :integer
      t.column :size,                     :string, :limit => 40
      t.column :description,              :string, :limit => 40
      t.column :shippingprice,            :double
      t.column :store_id,                 :integer


      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
