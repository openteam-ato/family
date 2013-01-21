class AddRelativesToChildren < ActiveRecord::Migration
  def change
    add_column :children, :relative_numbers, :string
  end
end
