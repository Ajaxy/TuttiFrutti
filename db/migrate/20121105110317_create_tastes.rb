class CreateTastes < ActiveRecord::Migration
  def change
    create_table :tastes do |t|
      t.string :code
      t.string :name
      t.string :yogurt
      t.string :fruits
      t.string :topings
      t.string :liquid
      t.string :color
      t.integer :votes, default: 0

      t.timestamps
    end

    add_index :tastes, :code, unique: true
    add_index :tastes, :votes
  end
end
