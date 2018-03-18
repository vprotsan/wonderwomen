class CreateAttaches < ActiveRecord::Migration[5.1]
  def change
    create_table :attaches do |t|
      t.belongs_to :attacheable, :polymorphic => true

      t.timestamps
    end
    add_index :attaches, :attacheable_id
  end
end
