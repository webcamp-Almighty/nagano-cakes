class Admins::ItemsController < ApplicationController

before_action :authenticate_admin!

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to admins_items_path, success: '登録に成功しました'
      else
        render 'new'
      end
  end

  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = 'successful!!'
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end


  private
      def item_params
        params.require(:item).permit(:name, :price, :is_soldout,
                                     :image, :introduction, :genre_id)
      end

end
