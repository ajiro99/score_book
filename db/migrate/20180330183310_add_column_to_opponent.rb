class AddColumnToOpponent < ActiveRecord::Migration[5.0]
  def change
  	add_column :opponents, :short_name, :string
  end
end
