class CommentsController < ApplicationController


  def create
    @board = Board.find(params[:board_id])
    @topic = Topic.find(params[:topic_id])

    @comment = Comment.new(comment_params)
    @comment.topic = @topic

    if @comment.save
      redirect_to board_topic_path(@board, @topic)
    else
      redirect_to :back, flash: { error: @comment.errors.full_messages.to_sentence }
    end
  end


  def show
    @comment = Comment.find_by_id(params[:id])


    if request.xhr?
      render partial: "shared/bubble", layout: false, locals: {
        comment: @comment,
        show_replies: true,
      }
    else
      render nothing: true
    end
  end


  private


  def comment_params
    params.require(:comment).permit(:author, :subject, :email, :text)
  end

end
