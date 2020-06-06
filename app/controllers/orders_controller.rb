class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new

  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if @order.save
      redirect_to orders_finish_path
    else
      render 'index'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def detail
    @orders = Order.all
   if params[:order_id]
      @order = Order.find(params[:order_id])
      @order_items = @order.order_items
   end

  end

  def finish
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address,
     :shipping_fees, :payment_method, :total_price, :order_status)
  end
end
