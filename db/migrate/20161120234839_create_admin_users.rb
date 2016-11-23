class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users, id: :uuid do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamp :last_login_at
      t.string :last_login_ip
      t.string :last_login_agent

      t.timestamps
    end
  end
end
