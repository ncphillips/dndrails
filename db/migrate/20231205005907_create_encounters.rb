class CreateEncounters < ActiveRecord::Migration[7.1]
  def change
    create_table :encounters do |t|
      t.string :title
      t.text :description
      t.references :campaign, null: false, foreign_key: true
      t.references :who_is_up, polymorphic: true, null: true

      t.timestamps
    end
  end
end
