class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.integer :x
      t.integer :y
      t.integer :board_id
      t.string :mark

      t.timestamps
    end
  end
end
