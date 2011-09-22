class AddColumnToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :sport,  :string
    add_column :stores, :established_in,  :string
    add_column :stores, :geardesignedby,  :string
    add_column :stores, :cause,  :string
  end

  def self.down
    remove_column :stores, :sport
    remove_column :stores, :established_in
    remove_column :stores, :geardesignedby
    remove_column :stores, :cause
  end
end
