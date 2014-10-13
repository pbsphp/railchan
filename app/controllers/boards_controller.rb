class BoardsController < ApplicationController


  def index
    @boards = Board.all
  end


  def show
    @board = Board.find(params[:id])
    @new_topic = Topic.new
    @topics = @board.topics.with_replies.with_comment_replies.page(params[:page])

    render "topics/index"
  end

end
