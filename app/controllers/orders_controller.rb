class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
  end

  def show
    @order = Order.find(params[:id])
  end

  def detail
  end

  def finish
  end
end
