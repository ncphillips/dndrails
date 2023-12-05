class CreateInitiatives < ActiveRecord::Migration[7.1]
  def change
    create_table :initiatives do |t|
      t.references :encounterable, polymorphic: true, null: false
      t.references :encounter, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
