class TopicsController < ApplicationController

  def index
    @board = Board.find(params[:board_id])
    @topics = Topic.all
    @new_topic = Topic.new
  end


  def show
    @board = Board.find(params[:board_id])
    @topic = Topic.find(params[:id])
    @new_comment = Comment.new
  end


  def new
    @board = Board.find(params[:board_id])
    @topic = Topic.new
  end


  def create
    @board = Board.find(params[:board_id])
    @topic = Topic.new(topic_params)
    @topic.board = @board
    @topic.save!

    redirect_to board_topic_path(@board, @topic)
  end


  private


  def topic_params
    params.require(:topic).permit(:author, :subject, :email, :text)
  end

end
