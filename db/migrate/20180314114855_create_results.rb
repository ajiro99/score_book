class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :game, foreign_key: true, null: false
      t.references :player, foreign_key: true, null: false
      t.integer :participation, null: false
      t.integer :time, default: 0, null: false
      t.integer :gool
      t.integer :gool_against
      t.integer :shoot
      t.integer :shoot_against
      t.integer :yellow_card, default: 0, null: false
      t.integer :red_card, default: 0, null: false

      t.timestamps
    end
  end
end
