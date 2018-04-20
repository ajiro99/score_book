class RenameColumnToResults < ActiveRecord::Migration[5.0]
  def change
    rename_column :results, :gool, :goal
    rename_column :results, :gool_against, :goal_against
  end
end
