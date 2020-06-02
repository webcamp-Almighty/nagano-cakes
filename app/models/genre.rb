class Genre < ApplicationRecord
	validates :name,  presence: true, length: { maximum: 20 }
	validates :is_invalid, inclusion: { in: [true, false] }

	has_many :genres
end
