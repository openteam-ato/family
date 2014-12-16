class CreateSocialProviders < ActiveRecord::Migration
  def change
    create_table :social_providers do |t|
      t.text :title
      t.text :short_title
      t.date :register_date
      t.text :incorporation_form
      t.text :address
      t.text :chief_fio
      t.text :terms_of_service
      t.text :audits
      t.text :work_experience
      t.text :additional_info

      t.timestamps
    end
  end
end
