class CreateOrganizationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_users, id: :uuid do |t|
      t.uuid :organization_id, null: false, foreign_key: true
      t.uuid :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
