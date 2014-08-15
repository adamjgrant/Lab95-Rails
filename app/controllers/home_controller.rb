class HomeController < ApplicationController
  def index
  	@panels = Panel.all
  end
end
