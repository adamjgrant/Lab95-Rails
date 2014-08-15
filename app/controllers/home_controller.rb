class HomeController < ApplicationController
  def index
  	@panels = Panel.where(user_id: current_user.id)
  end
end
