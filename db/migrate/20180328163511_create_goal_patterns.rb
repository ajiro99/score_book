class CreateGoalPatterns < ActiveRecord::Migration[5.0]
  def change
    create_table :goal_patterns do |t|
      t.references :game, foreign_key: true, null: false
      t.integer :goal_time
      t.references :player, foreign_key: true, null: false
      t.references :assist_player, foreign_key: true
      t.integer :pattern
      t.integer :starting_area
      t.integer :goal_area
      t.integer :goal_parts

      t.timestamps
    end

    add_foreign_key :goal_patterns, :players, column: :assist_player_id
  end
end
