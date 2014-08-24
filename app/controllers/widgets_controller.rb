class WidgetsController < ApplicationController
  def index
    @panel = Panel.find(params[:panel_id])
  end

  def create
    @panel = Panel.find(params[:panel_id])

    widget = @panel.widgets.new(name: t('panels.show.new_widget_text'))

    if widget.save
      redirect_to @panel
    end
  end

  def update
    @panel = Panel.find(params[:panel_id])
    widget = @panel.widgets.find(params[:id])

    if widget.update(widget_params)
      render :nothing => true, status: 200
    else
      render @panel, :alert => "Could not update widget due to an internal error"
    end
  end

  private
    def widget_params
      params.require(:widget).permit(:name, :input)
    end
end
