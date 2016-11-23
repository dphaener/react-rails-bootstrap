class AddLoginCounts < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :login_count, :integer, default: 0
    add_column :admin_users, :login_count, :integer, default: 0
    add_column :organization_admins, :login_count, :integer, default: 0
  end
end
