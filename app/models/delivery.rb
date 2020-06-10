class Delivery < ApplicationRecord
	belongs_to :end_user

	#配送先の登録
	validates :name, presence:true
	validates :address, presence:true
end
