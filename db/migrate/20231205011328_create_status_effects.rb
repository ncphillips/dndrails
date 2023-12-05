class CreateStatusEffects < ActiveRecord::Migration[7.1]
  def change
    create_table :status_effects do |t|
      t.integer :rounds
      t.references :encounterable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
