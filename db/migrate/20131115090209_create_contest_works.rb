class CreateContestWorks < ActiveRecord::Migration
  def change
    create_table :contest_works do |t|
      t.string :name
      t.integer :age
      t.text :description

      t.timestamps
    end
    add_attachment :contest_works, :photo
    add_attachment :contest_works, :work
  end
end
