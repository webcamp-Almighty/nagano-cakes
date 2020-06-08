class OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def index
    #@orders = Order.all
    #@total_price = @shipping_fees + current_end_user.cart_item_sum
    @order_items = OrderItem.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id

    if @order.save
      @cart_items = current_end_user.cart_items
      #each
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item.id
        @order_item.order_id = @order.id
        @order_item.number = cart_item.number
        @order_item.tax_item_price = cart_item.item.price
        #@order_item.order_status = 0 #デフォルト値設定したら、この記述いらない
        @order_item.save
      end
        redirect_to finish_orders_path
    else
      #@total_price = @shipping_fees + current_end_user.cart_item_sum
      @cart_items = CartItem.where(end_user_id: current_end_user.id)
      render 'detail',notice: "もう一度やり直してください"
    end

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def detail
    #@total_price = @order.shipping_fees + current_end_user.cart_item_sum
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @order = Order.new(order_params)
    if params[:radio_button] == "1"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name
      #@order.first_name = current_end_user.first_name
    elsif params[:radio_button] == "2"
      @delivery = Delivery.find(params[:order][:delivery_id]) #記述
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.name = @delivery.name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:name]
      @order.name = params[:order][:address]
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
