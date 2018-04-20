class RenameColumnToGames < ActiveRecord::Migration[5.0]
  def change
    rename_column :games, :gool, :goal
    rename_column :games, :gool_against, :goal_against
  end
end
