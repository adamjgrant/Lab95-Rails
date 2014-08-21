class PanelsController < ApplicationController

  def index
    @panels = Panel.where(user_id: current_user.id)
  end

  def create
    @panel = Panel.new(name: t('panels.new.new_panel_text'), user_id: current_user.id)

    if @panel.save
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
      render :nothing => true, status: 200
    else
      # TODO Pretend to be a legitimate developer
      raise "shit"
    end
  end
end
