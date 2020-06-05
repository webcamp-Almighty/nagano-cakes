class ItemsController < ApplicationController

  def index
  	@items = Item.all
  	@genres = Genre.all

    #条件分岐が必要
    if params[:genre_id]
    #if params[:id]
    	@genre = Genre.find(params[:genre_id])#ここのコードの意味
      #@genre = Genre.find(params[:id])
      @items = @genre.items
    end
  end

  def show
  	@item = Item.find(params[:id])
    @cart_item = CartItem.new
  	@genres = Genre.all
  end

  # def search
  #   if params[:name].present?
  #     @items = Item.where('name LIKE ?', "%#{params[:name]}%")
  #   else
  #     @items = Item.none
  #   end
  # end

end
