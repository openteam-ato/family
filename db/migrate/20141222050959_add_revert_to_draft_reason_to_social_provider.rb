class AddRevertToDraftReasonToSocialProvider < ActiveRecord::Migration
  def change
    add_column :social_providers, :revert_to_draft_reason, :text
  end
end
