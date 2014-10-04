class BoardsController < ApplicationController


  def index
    # @boards list in ApplicationController
  end


  def show
    @board = Board.find(params[:id])
  end

end
