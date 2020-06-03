class Item < ApplicationRecord
  belongs_to :genre
  attachment :image #refile用

end

#enum is_soldout:{ sales: false, soldout: true}
#enum drink:{ greentea: 4, coffee: 0, tea: 1, beer: 2, wine: 3 }
#0が販売中、1が売り切れ

#boolean型の場合