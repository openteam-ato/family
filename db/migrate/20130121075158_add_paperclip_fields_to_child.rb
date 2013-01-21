class AddPaperclipFieldsToChild < ActiveRecord::Migration
  def change
    add_attachment :children, :photo
  end
end
