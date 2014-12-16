class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :seria
      t.string :number
      t.text :activity_kind
      t.text :issuing_organization
      t.date :issue_date
      t.date :expiration_date
      t.references :social_provider

      t.timestamps
    end
    add_index :licenses, :social_provider_id
  end
end
