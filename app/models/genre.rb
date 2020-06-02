class Genre < ApplicationRecord
	has_many:items
	validates :name,  presence: true, length: { maximum: 20 }
	validates :is_invalid, inclusion: { in: [true, false] }
end
