class CreateSocialServices < ActiveRecord::Migration
  def change
    create_table :social_services do |t|
      t.string :kind
      t.text :title
      t.string :price
      t.references :social_provider

      t.timestamps
    end
    add_index :social_services, :social_provider_id
  end
end
