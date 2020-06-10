class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item

	enum item_status:{ creat_not: 0, creat_wait: 1, creat_now: 2, creat_finish: 3}
	#着手不可,製作待ち,製作中,製作完了

	validates :number, presence: true
	validates :tax_item_price, presence: true
end
