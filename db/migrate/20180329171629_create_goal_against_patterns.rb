class CreateGoalAgainstPatterns < ActiveRecord::Migration[5.0]
  def change
    create_table :goal_against_patterns do |t|
      t.references :game, foreign_key: true, null: false
      t.integer :goal_against_time
      t.references :goal_against_player, foreign_key: true, null: false
      t.integer :pattern
      t.integer :starting_area
      t.integer :goal_area
      t.integer :goal_parts

      t.timestamps
    end

    add_foreign_key :goal_against_patterns, :players, column: :goal_against_player
  end
end
