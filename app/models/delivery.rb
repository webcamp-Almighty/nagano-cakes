class Delivery < ApplicationRecord
	belongs_to :end_user, :item
end
