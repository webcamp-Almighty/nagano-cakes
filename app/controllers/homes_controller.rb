class HomesController < ApplicationController

 def top
  	@items = Item.all
  	@genres = Genre.all
  	@items = Item.page(params[:page]).reverse_order.per(8)
 end

end