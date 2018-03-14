class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :year, null: false, null: false
      t.integer :number, null: false, null: false
      t.string :name, null: false, null: false
      t.integer :position, null: false, null: false
      t.date :birthday, null: false, null: false
      t.integer :height, null: false, null: false
      t.integer :weight, null: false, null: false

      t.timestamps
    end
  end
end
