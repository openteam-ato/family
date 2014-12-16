class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :kind
      t.string :value
      t.references :social_provider
      t.string :type

      t.timestamps
    end
    add_index :contacts, :social_provider_id
  end
end
