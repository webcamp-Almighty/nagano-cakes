class Order < ApplicationRecord
	belongs_to :end_user #追記
	has_many :order_items

	enum order_status:{ waiting: 0, confirmation: 1, progress: 2, preparing: 3, shipped: 4 }

	enum payment_method: {
		credit_card: 0,
		bank_transfer: 1
	}



  def total_price
    total = 0
    order_items.each do |order_item|
      total += order_item.tax_item_price * order_item.number
    end
    total
  end


end








#enum drink:{ greentea: 4, coffee: 0, tea: 1, beer: 2, wine: 3 }

#入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4