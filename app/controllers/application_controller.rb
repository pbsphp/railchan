class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Boards and boards groups for header
  before_filter :get_boards_and_boards_groups


  private


  def get_boards_and_boards_groups
    @boards_groups = BoardsGroup.eager_load(:boards)
  end
end
