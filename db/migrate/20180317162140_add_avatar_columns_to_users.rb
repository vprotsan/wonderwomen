class AddAvatarColumnsToUsers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :products, :picture
  end

  def down
    remove_attachment :products, :picture
  end
end
