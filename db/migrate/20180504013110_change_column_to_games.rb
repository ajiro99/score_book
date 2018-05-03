class ChangeColumnToGames < ActiveRecord::Migration[5.0]
  def change
    change_column :games, :section, :integer, null: true
  end
end
