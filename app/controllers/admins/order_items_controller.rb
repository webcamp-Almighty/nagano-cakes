class Admins::OrderItemsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to admins_orders_path
    else
      render :show
    end
  end
  
  private
    def order_item_params
      params.require(:order_item).permit(:item_status)
    end
end
