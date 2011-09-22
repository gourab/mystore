class AddColumnStoreTypeToStores < ActiveRecord::Migration
  def self.up
    add_column :stores, :store_type, :string
    add_column :users, :user_type, :string
  end

  def self.down
    remove_column :stores, :store_type
    remove_column :users, :user_type
  end
end
