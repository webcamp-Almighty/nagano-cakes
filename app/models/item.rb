class Item < ApplicationRecord
  belongs_to :genre
  attachment :image #refile用
end
