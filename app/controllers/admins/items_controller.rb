class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_url
      else
        render new
      end
  end

  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  private
      def item_params
        params.require(:item).permit(:name, :price, :is_soldout,
                                     :image, :introduction, :genre_id)
      end

end
