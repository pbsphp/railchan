class TopicsController < ApplicationController
  before_filter :init_board


  def index
    @topics = Topic.with_replies.with_comment_replies.page(params[:page])
    @new_topic = Topic.new
  end


  def show
    @topic = Topic.find(params[:id])
    @new_comment = Comment.new
  end


  def create
    @topic = Topic.new(topic_params)
    @topic.ip = request.remote_addr
    @topic.board = @board

    if @topic.save
      redirect_to board_topic_path(@board, @topic)
    else
      redirect_to :back, flash: { error: @topic.errors.full_messages.to_sentence }
    end
  end


  private


  def topic_params
    params.require(:topic).permit(:author, :subject, :email, :text)
  end


  def init_board
    @board = Board.find(params[:board_id])
  end

end
