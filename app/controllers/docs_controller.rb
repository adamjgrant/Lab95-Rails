class DocsController < ApplicationController
  def index
  end

  def show
    render params[:id]
  end
end
