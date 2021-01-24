class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :shippings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  
  def total_payment
    total = 0
    self.cart_items.each do |cart_item|
      total = total + cart_item.quantity * cart_item.price
    end
    return total
  end
end
