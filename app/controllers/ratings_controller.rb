class RatingsController < ApplicationController

  def edit
  end

  def show
    @rating = Rating.find(params[:id])
  end
end
