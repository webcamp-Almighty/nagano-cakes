class FavoritesController < ApplicationController
	def create
            @item = Item.find(params[:item_id])
            favorite = Favorite.new(end_user_id: current_end_user.id, item_id: params[:item_id])
             favorite.save
            # favorite = Favorite.new()
            # favorite.end_user_id = current_end_user.id
            # favorite.item_id = item.id
            # favorite.save
            # redirect_to items_path
        end
        def destroy
            @item = Item.find(params[:item_id])
            favorite = current_end_user.favorites.find_by(item_id: params[:item_id])
            favorite.destroy
            # favorite = current_end_user.favorites.find_by(item_id: item.id)
            # favorite.destroy
            # redirect_to items_path
        end
end

# 　　　　　　　item = Item.find(params[:item_id])
#             favorite = current_end_user.favorites.new(item_id: item.id)
#             favorite.save
#             redirect_to item_path(item)

#Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id)
#  =>1.2.3 item_id