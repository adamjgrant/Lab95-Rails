class PanelsController < ApplicationController

  def index
    @panels = Panel.where(user_id: current_user.id)
  end

  def create
    @panel = Panel.new(name: "New Panel", user_id: current_user.id)

    if @panel.save
      # Could not get shorthand way to do this to work.
      redirect_to @panel
    end
  end

  def show
    @panel = Panel.find(params[:id])
  end

  def destroy
  	@panel = Panel.find(params[:id])
  	if @panel.destroy
      redirect_via_turbolinks_to root_path
    end
  end

  def update
  	@panel = Panel.find(params[:id])
    if @panel.update(name: params[:name])
      render :index
    end
  end
end
