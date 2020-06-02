class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
    #ジャンル検索
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def edit
  end

  def update
  end
end
