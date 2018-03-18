class AddPictureColumnsToAttach < ActiveRecord::Migration[5.1]
  def change
    add_attachment :attaches, :picture
  end
end
