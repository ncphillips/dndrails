class AddUserToDungeonMasters < ActiveRecord::Migration[7.1]
  def change
    add_reference :dungeon_masters, :user, null: false, foreign_key: true
    remove_column :dungeon_masters, :name, :string
  end
end
