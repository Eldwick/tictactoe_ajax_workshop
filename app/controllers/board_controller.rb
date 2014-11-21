class BoardController < ApplicationController
  def new
  end

  def show
    @board = Board.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @board.json_formatted_rows}
    end
  end

  def create
    @board = Board.create()
    @board.create_tiles

    redirect_to  show_board_path(@board.id)
  end

  def update_tile
    tile = Tile.find(params[:id])
    tile.update(mark: params[:mark])
    turn = !("X" == params[:mark])
    tile.board.update(is_xturn: turn )

    respond_to do |format|
      format.json { render json: {hi: "hi"}}
    end

  end
end
