class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users" do |t|
      t.column :login,                     :string, :limit => 40
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime
      t.column :status,                    :boolean
    end
    User.reset_column_information
    admin = User.new(:login => 'admin',
      :email =>'gourab.techno@gmail.com',
      :password => 'admin123',
      :password_confirmation => 'admin123',
      :status => true,
      :activation_code => nil,
      :activated_at => Time.now.utc
    )
    admin.save!
    user = User.find(:first, :conditions => ["email =?",'gourab.techno@gmail.com'])
    user.activation_code = nil
    user.save
  end


def self.down
  drop_table "users"
end
end
