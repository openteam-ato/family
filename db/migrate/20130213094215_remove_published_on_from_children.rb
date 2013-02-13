class RemovePublishedOnFromChildren < ActiveRecord::Migration
  def up
    remove_column :children, :published_on
  end

  def down
    add_column :children, :published_on, :date
  end
end
