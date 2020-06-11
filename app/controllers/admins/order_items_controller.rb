class Admins::OrderItemsController < ApplicationController
  
before_action :authenticate_end_user!
  
  def show
    
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(item_status: params[:item_status])
      redirect_to admins_orders_path
    else
      render :show
    end
  end
  
  # private
  #   def order_item_params
  #     permit(:item_status)
  #   end
end
