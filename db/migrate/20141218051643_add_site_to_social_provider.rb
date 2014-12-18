class AddSiteToSocialProvider < ActiveRecord::Migration
  def change
    add_column :social_providers, :site, :string
  end
end
