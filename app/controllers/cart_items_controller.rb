class CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  def index
  	@cart_items = current_end_user.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    if current_end_user.cart_items.exists?(item_id: @cart_item.item_id)
      @cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
      # @cart_item.number += params[:number].to_i
      num = @cart_item.number + params[:cart_item][:number].to_i
      @cart_item.update(number: num)
      # @cart_item.update(number: @cart_item.number + params[:cart_item][:number].to_i)
      # numberカラムにnumを入れる。15行目の記述は13~14行目を一行で表した記述
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end

#     CartItem.find_by(item_id: @cart.item_id)
#     exist?エラー文のやつ存在してたら加算if文
#     if exist
#       cart_item = CartItem.find(id)



# # 商品idとカート内の商品idを比べる
#     if params[:item_id] == cart_item.item.id
#       cart_item.update
#       redirect_to cart_items_path, notice: "カートに商品が追加されました。"
#     else
#       cart_item.save
#       redirect_to cart_items_path, notice: "カートに商品が追加されました。"
#     end

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
