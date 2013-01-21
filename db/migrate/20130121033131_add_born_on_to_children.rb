class AddBornOnToChildren < ActiveRecord::Migration
  def change
    add_column :children, :born_on, :date
  end
end
