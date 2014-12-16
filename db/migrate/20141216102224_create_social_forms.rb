class CreateSocialForms < ActiveRecord::Migration
  def change
    create_table :social_forms do |t|
      t.string :kind
      t.integer :places_number
      t.integer :free_places_number
      t.references :social_provider

      t.timestamps
    end
    add_index :social_forms, :social_provider_id
  end
end
