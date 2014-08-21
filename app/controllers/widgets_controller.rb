class WidgetsController < ApplicationController
  def index
    @panel = Panel.find(params[:panel_id])
  end

  def create
    @panel = Panel.find(params[:panel_id])

    widget = @panel.widgets.new(name: 'New Widget')

    if widget.save
      redirect_to @panel
    end
  end

  private
    def widget_params
      params.require(:widget).permit(:name)
    end
end
