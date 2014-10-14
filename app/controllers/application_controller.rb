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


  def protect_from_banned
    ban = Ban.find_by_ip(request.remote_addr)
    if ban.present? && (ban.expires_at.nil? || (ban.expires_at > Time.now.utc))
      redirect_to :back, flash: {
        error: %Q<You are banned! Reason: "#{ban.reason}". Expires: #{
                  ban.expires_at.present? ?
                    ban.expires_at :
                    "never"
                  }.>
        }
    end
  end
end
