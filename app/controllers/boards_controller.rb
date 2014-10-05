class BoardsController < ApplicationController


  def index
    @boards = Board.all
  end


  def show
    @board = Board.find(params[:id])
    @new_topic = Topic.new
  end

end
