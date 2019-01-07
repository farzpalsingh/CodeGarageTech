class AddIpAddressUserTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ip_address, :string
    add_column :users, :user_type, :string
    change_column :users, :email, :string, null: true, default: false
    change_column :users, :encrypted_password, :string, null: true, default: false
  end
end