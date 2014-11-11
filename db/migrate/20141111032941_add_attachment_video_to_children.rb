class AddAttachmentVideoToChildren < ActiveRecord::Migration
  def self.up
    add_attachment :children, :video
  end

  def self.down
    remove_attachment :children, :video
  end
end
