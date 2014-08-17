class PanelsController < ApplicationController

  def create
    @panel = Panel.create(:name => "New Panel", :user_id => current_user.id)
    render :show, :id => @panel.id
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
