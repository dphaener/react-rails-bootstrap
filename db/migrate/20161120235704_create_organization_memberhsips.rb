class CreateOrganizationMemberhsips < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_memberhsips, id: :uuid do |t|
      t.uuid :organization_id, null: false, foreign_key: true
      t.uuid :organization_admin_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
