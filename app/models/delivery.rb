class Delivery < ApplicationRecord
	belongs_to :end_user

	#配送先の登録
	validates :name, presence:true
	validates :address, presence:true


	#複数カラムの結合　登録先住所+(名前)
	def view_address_and_name
	   self.address + '(' + self.name + ')'
	end
end
