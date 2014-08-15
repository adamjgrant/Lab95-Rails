class PanelsController < ApplicationController
  def create
    @panel = Panel.create(name: "New Panel", user_id: current_user.id)

    # TODO: Render current page...or maybe it actually is going somewhere?
    redirect_via_turbolinks_to root_path
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
end
