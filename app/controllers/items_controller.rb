class ItemsController < ApplicationController

  def index
  	@items = Item.all
  	@genres = Genre.all

    #条件分岐が必要
    if params[:genre_id]
    #if params[:id]
    	@genre = Genre.find(params[:genre_id])
      #@genre = Genre.find(params[:id])
      @items = @genre.items
    end
  end

  def show
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  end

end
