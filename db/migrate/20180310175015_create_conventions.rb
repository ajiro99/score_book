class CreateConventions < ActiveRecord::Migration[5.0]
  def change
    create_table :conventions do |t|
      t.integer :year
      t.integer :convention_type

      t.timestamps
    end
  end
end
