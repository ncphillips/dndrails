class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :player, null: true, foreign_key: true

      t.timestamps
    end
  end
end
