class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :setup_sidebar

  private

    def setup_sidebar
      if user_signed_in?
        @user = current_user
        @panels = Panel.where(user_id: @user.id)
      else
        @panels = []
      end
    end

end
