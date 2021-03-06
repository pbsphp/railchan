class CommentsController < ApplicationController
  before_filter :protect_from_banned, only: :create


  def create
    @board = Board.friendly.find(params[:board_id])
    @topic = Topic.find(params[:topic_id])

    @comment = Comment.new(comment_params)
    @comment.topic = @topic
    @comment.ip = request.remote_addr

    if @comment.save
      redirect_to board_topic_path(@board, @topic)
    else
      redirect_to :back, flash: { error: @comment.errors.full_messages.to_sentence }
    end
  end


  def show
    @comment = Comment.find(params[:id])

    if request.xhr?
      render @comment
    else
      render nothing: true
    end
  end


  private


  def comment_params
    params.require(:comment).permit(:author, :subject, :email, :text)
  end

end
