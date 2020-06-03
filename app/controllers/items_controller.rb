class ItemsController < ApplicationController

  def index
  	@items = Item.all
  	@genres = Genre.all
  	#binding.pry
  	#@genre = Genre.find(1)
  	@genre = Genre.find(2)

  	#@genre = Genre.find(params[:id])
  end

  def show
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  end

end
