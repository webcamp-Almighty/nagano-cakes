class ItemsController < ApplicationController

  def index
  	@items = Item.all
  	@genres = Genre.all
  	#binding.pry
  	#@genre = Genre.find(1)
  	@genre = Genre.find(2)

  	#@genre = Genre.find(params[:id])
  end

  def show
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  end
  
  # def search
  #   if params[:name].present?
  #     @items = Item.where('name LIKE ?', "%#{params[:name]}%")
  #   else
  #     @items = Item.none
  #   end
  # end

end
