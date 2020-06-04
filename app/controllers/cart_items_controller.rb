class CartItemsController < ApplicationController
  def index
  	@cart_items = current_end_user.cart_items
  end

  def create
  	@cart_item = current_end_user.cart_items.new(cart_item_params)
  	@cart_item.end_user_id = current_end_user.id
   	@cart_item.save
   	redirect_to cart_items_path
  end

  def destroy
  	cart_item = Cartitem.find(params[:id])
  	cart_item.destroy
  end

  def empty
  	end_user = end_user.find(current_end_user.id)
  	end_user.cart_items.destroy
  	redirect_to cart_items_path
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:number)
  end
end
