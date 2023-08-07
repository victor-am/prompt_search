class SearchesController < ApplicationController
  def new
  end

  def create
    @results = Prompt.search(params[:query], size: 25).records.to_a
    render :show
  end
end
