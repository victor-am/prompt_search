class SearchesController < ApplicationController
  def new
  end

  def create
    @results = Prompt.search(params[:query]).records.to_a
    render :show
  end
end
