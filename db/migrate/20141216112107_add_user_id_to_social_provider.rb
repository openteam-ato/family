class AddUserIdToSocialProvider < ActiveRecord::Migration
  def change
    add_column :social_providers, :user_id, :integer
  end
end
