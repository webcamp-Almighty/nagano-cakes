class Genre < ApplicationRecord
	validates :name,  presence: true, length: { maximum: 20 }
	validates :is_invalid,  presence: true
end
