class CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  def index
  	@cart_items = current_end_user.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    # 個数選択をした場合、すでにカートに同一商品が存在するかどうかで条件分岐
    if params[:cart_item][:number].to_i != 0
      if current_end_user.cart_items.exists?(item_id: @cart_item.item_id)
        # カートに同一商品が存在した場合はitem_idで当該商品を探索する
        @cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
        num = @cart_item.number + params[:cart_item][:number].to_i
        # @cart_item.number += params[:cart_item][:number].to_iも同義
        @cart_item.update(number: num)
        # numberカラムにnumを入れる。一行で表すと19行目
        # @cart_item.update(number: @cart_item.number + params[:cart_item][:number].to_i)
        redirect_to cart_items_path, notice: "商品の数量が追加されました。"
      else
        @cart_item.save
        redirect_to cart_items_path, notice: "カートに商品が追加されました。"
      end
    else
      @item = Item.find(params[:cart_item][:item_id])
      @genres = Genre.all
      redirect_to item_path(@item), notice: '数量を選択してください。'
    end
  	# @cart_item = CartItem.new(cart_item_params)
  	# @cart_item.end_user_id = current_end_user.id
   # 	if @cart_item.save
   #    redirect_to cart_items_path, notice: "カートに商品が追加されました。"
   #  else
   #    redirect_back(fallback_location: root_path)
   #  end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: "商品の数量が変更されました。"
  end

  def destroy
  	cart_item = CartItem.find(params[:id])
  	cart_item.destroy
  	redirect_to cart_items_path, notice: "商品が１件、削除されました。"
  end

  def empty
  	end_user = EndUser.find(current_end_user.id)
  	end_user.cart_items.destroy_all
  	redirect_to cart_items_path, notice: "カートの商品がすべて削除されました。"
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:item_id, :number)
  end
end
