class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to finish_orders_path
    else
      @cart_items = CartItem.where(end_user_id: current_end_user.id)
      render :detail, notice: "もう一度やり直してください"
    end

  end

  def show
    @order = Order.find(params[:id])
  end

  def detail
    @shipping_fees = 800
    @total_price = @shipping_fees + current_end_user.cart_item_sum
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @order = Order.new(order_params)

    # if params[:order][:radio_button] == 1
    #   @oneorder.postal_code = current_end_user.postal_code
    #   @oneorder.address = current_user.address
    # else params[:order][:radio_button] == 2
    #   @oneorder.postal_code =
    # if @order.save
    #   redirect_to finish_orders_path
    # else
    #   flash[:notice] = "もう一度やり直してください"
    #   render :detail
    # end
  end

  def finish
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address,
     :shipping_fees, :payment_method, :total_price, :order_status)
  end
end
