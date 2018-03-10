class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :convention, foreign_key: true, null: false
      t.string :section, null: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.references :opponent, foreign_key: true, null: false
      t.integer :home_away, null: false
      t.integer :weather, null: false
      t.integer :temperature, null: false
      t.string :referee
      t.integer :result, null: false
      t.integer :gool, default: 0, null: false
      t.integer :gool_against, default: 0, null: false
      t.integer :shoot, default: 0, null: false
      t.integer :shoot_against, default: 0, null: false
      t.integer :ck, default: 0, null: false
      t.integer :ck_against, default: 0, null: false
      t.integer :fk, default: 0, null: false
      t.integer :fk_against, default: 0, null: false
      t.integer :yellow_card, default: 0, null: false
      t.integer :gave_yellow_card, default: 0, null: false
      t.integer :red_card, default: 0, null: false
      t.integer :gave_red_card, default: 0, null: false
      t.decimal :dominance_rate, precision: 5, scale: 2
      t.integer :first_change_time
      t.references :first_change_out
      t.references :first_change_in
      t.integer :second_change_time
      t.references :second_change_out
      t.references :second_change_in
      t.integer :third_change_time
      t.references :third_change_out
      t.references :third_change_in
      t.integer :number_of_visitors
      t.integer :rank

      t.timestamps
    end

    add_foreign_key :games, :players, column: :first_change_out_id
    add_foreign_key :games, :players, column: :first_change_in_id
    add_foreign_key :games, :players, column: :second_change_out_id
    add_foreign_key :games, :players, column: :second_change_in_id
    add_foreign_key :games, :players, column: :third_change_out_id
    add_foreign_key :games, :players, column: :third_change_in_id
  end
end
