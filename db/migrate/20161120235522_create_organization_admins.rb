class CreateOrganizationAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_admins, id: :uuid do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.uuid :organization_id, null: false, foreign_key: true
      t.string :last_login_ip
      t.string :last_login_agent
      t.timestamp :last_login_at

      t.timestamps
    end
  end
end
