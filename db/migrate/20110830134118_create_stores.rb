class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.column :firstname,                     :string, :limit => 40
      t.column :lastname,                     :string, :limit => 40
      t.column :organizationname,                     :string, :limit => 40
      t.column :email,                     :string, :limit => 40
      t.column :address1,                     :string, :limit => 40
      t.column :address2,                     :string, :limit => 40
      t.column :city,                     :string, :limit => 40
      t.column :state,                     :string, :limit => 40
      t.column :zip,                     :string, :limit => 40
      t.column :phone,                     :string, :limit => 40
      t.column :user_id,                     :string, :limit => 40
      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
