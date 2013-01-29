class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
