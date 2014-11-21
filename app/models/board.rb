class Board < ActiveRecord::Base
  has_many :tiles

  def create_tiles
    tiles_array = []
    (0..2).each do |row_index|
      (0..2).each do |col_index|
        tile = Tile.create(y: row_index, x: col_index)
        tiles_array << tile
      end
    end
    self.tiles << tiles_array
  end

  def rows
    board = []
    (0..2).each do |row_index|
      row = []
      (0..2).each do |col_index|
        tile = self.tiles.find_by(y: row_index, x: col_index)
        row << tile
      end
      board << row
    end
    board
  end

  def json_formatted_rows
    board = []
    (0..2).each do |row_index|
      row = []
      (0..2).each do |col_index|
        tile = self.tiles.find_by(y: row_index, x: col_index)
        row << tile.mark
      end
      board << row
    end
    board
  end

end
