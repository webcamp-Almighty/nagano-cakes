class Item < ApplicationRecord
  has_many :cart_items
  belongs_to :genre
  has_many :order_items
  attachment :image #refile用
  has_many :favorites, dependent: :destroy#いいね
  
  def favorited_by?(end_user)
     favorites.where(end_user_id: end_user.id).exists?
  end

  validates :name, presence: true
  validates :price, presence: true

  #boolean型のバリデーション
  validates :is_soldout, inclusion: { in: [true, false]}
  validates :introduction,  presence: true

end

#enum is_soldout:{ sales: false, soldout: true}
#enum drink:{ greentea: 4, coffee: 0, tea: 1, beer: 2, wine: 3 }

