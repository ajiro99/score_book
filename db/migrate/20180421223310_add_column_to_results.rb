class AddColumnToResults < ActiveRecord::Migration[5.0]
  def change
  	add_column :results, :assist, :integer, default: 0
    change_column :results, :goal, :integer, default: 0
    change_column :results, :shoot, :integer, default: 0
  end
end
