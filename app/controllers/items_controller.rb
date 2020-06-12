class ItemsController < ApplicationController

  def index
  	@items = Item.all
  	@genres = Genre.all
    @items = Item.page(params[:page]).reverse_order.per(8)
    #条件分岐が必要
    if params[:genre_id]
    #if params[:id]
    	@genre = Genre.find(params[:genre_id])
      #@genre = Genre.find(params[:id])
      @items = @genre.items
      @items = Item.page(params[:page]).reverse_order.per(8)
    end

    @item_ranking = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))

  end

  def show
  	@item = Item.find(params[:id])
    @cart_item = CartItem.new
  	@genres = Genre.all
  end


end
