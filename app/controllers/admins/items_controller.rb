class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_url
  end

  def index
    @genres = Genre.all
  end

  private
      def item_params
        params.require(:item).permit(:name, :price, :is_soldout,
                                     :image, :introduction, :genre_id)
      end

end
