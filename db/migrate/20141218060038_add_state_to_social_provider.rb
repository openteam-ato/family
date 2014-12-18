class AddStateToSocialProvider < ActiveRecord::Migration
  def change
    add_column :social_providers, :state, :string
  end
end
