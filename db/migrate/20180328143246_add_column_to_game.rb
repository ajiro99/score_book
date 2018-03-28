class AddColumnToGame < ActiveRecord::Migration[5.0]
  def change
  	add_column :games, :pk, :integer, default: 0
    add_column :games, :pk_against, :integer, default: 0
    add_column :games, :video_url, :string
  end
end
