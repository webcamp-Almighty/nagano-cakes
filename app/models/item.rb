class Item < ApplicationRecord
  has_many :cart_items
  belongs_to :genre
  attachment :image #refile用
end
