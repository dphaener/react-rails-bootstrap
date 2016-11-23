class AddFacebookDataToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook_profile, :jsonb
  end
end
