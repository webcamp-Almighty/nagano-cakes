class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy#いいね

  #boolean型のバリデーション
  validates :is_deleted, inclusion: { in: [true, false] }

  #sign_up,login
  validates :last_name,presence:true
  validates :first_name, presence: true
  validates :last_name_kana,presence:true
  validates :first_name_kana, presence: true
  validates :telephone_number, presence:true
  validates :postal_code, presence:true
  validates :address, presence:true


  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def cart_item_sum
  	total = 0
  	cart_items.each do |cart_item|
  		total += cart_item.item.price * cart_item.number
  	end
  	total
  end



end
