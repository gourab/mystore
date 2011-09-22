class AddColumnToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_at, :string
  end

  def self.down
    remove_column :orders , :payment_at
  end
end
