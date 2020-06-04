class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_items
  attachment :image #refile用

end

#enum is_soldout:{ sales: false, soldout: true}
#enum drink:{ greentea: 4, coffee: 0, tea: 1, beer: 2, wine: 3 }

