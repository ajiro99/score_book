class ChangeColumnToGame < ActiveRecord::Migration[5.0]
  def up
    change_column :games, :date, :date, null: true
    change_column :games, :start_time, :time, null: true
    change_column :games, :home_away, :integer, null: true
    change_column :games, :weather, :integer, null: true
    change_column :games, :temperature, :integer, null: true
    change_column :games, :result, :integer, null: true
    change_column :games, :gool, :integer, null: true
    change_column :games, :gool_against, :integer, null: true
    change_column :games, :shoot, :integer, null: true
    change_column :games, :shoot_against, :integer, null: true
    change_column :games, :ck, :integer, null: true
    change_column :games, :ck_against, :integer, null: true
    change_column :games, :fk, :integer, null: true
    change_column :games, :fk_against, :integer, null: true
    change_column :games, :yellow_card, :integer, null: true
    change_column :games, :gave_yellow_card, :integer, null: true
    change_column :games, :red_card, :integer, null: true
    change_column :games, :gave_red_card, :integer, null: true
    change_column :games, :dominance_rate, :integer
  end

  def down
    change_column :games, :date, :date, null: false
    change_column :games, :start_time, :time, null: false
    change_column :games, :home_away, :integer, null: false
    change_column :games, :weather, :integer, null: false
    change_column :games, :temperature, :integer, null: false
    change_column :games, :result, :integer, null: false
    change_column :games, :gool, :integer, null: false
    change_column :games, :gool_against, :integer, null: false
    change_column :games, :shoot, :integer, null: false
    change_column :games, :shoot_against, :integer, null: false
    change_column :games, :ck, :integer, null: false
    change_column :games, :ck_against, :integer, null: false
    change_column :games, :fk, :integer, null: false
    change_column :games, :fk_against, :integer, null: false
    change_column :games, :yellow_card, :integer, null: false
    change_column :games, :gave_yellow_card, :integer, null: false
    change_column :games, :red_card, :integer, null: false
    change_column :games, :gave_red_card, :integer, null: false
    change_column :games, :dominance_rate, :decimal, precision: 5, scale: 2
  end
end
