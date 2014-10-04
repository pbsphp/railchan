class CommentsController < ApplicationController


  def index
    @board = Board.find(params[:board_id])
    @topic = Topic.find(params[:topic_id])
    @comments = Comment.all
  end


  def new
    @board = Board.find(params[:board_id])
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end


  def create
    @board = Board.find(params[:board_id])
    @topic = Topic.find(params[:topic_id])

    @comment = Comment.new(comment_params)
    @comment.topic = @topic
    @comment.save!
  end


  private


  def comment_params
    params.require(:comment).permit(:author, :subject, :email, :text)
  end

end
