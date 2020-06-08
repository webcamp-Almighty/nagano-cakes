class CartItem < ApplicationRecord
	belongs_to :end_user
	belongs_to :item
    # 商品詳細ページで個数選択しないとカートに遷移しない
    validates :number, presence: true
end
