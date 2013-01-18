class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.date :published_on
      t.string :number
      t.string :name
      t.string :hair_color
      t.string :eyes_color
      t.string :living_arrangement
      t.string :sex

      t.timestamps
    end
  end
end
