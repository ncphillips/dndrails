class CreatePlayerInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :player_invites do |t|
      t.string :email
      t.references :campaign, null: false, foreign_key: true
      t.references :invited_by, null: false, foreign_key: { to_table: :users }
      t.string :status

      t.timestamps
    end
  end
end
