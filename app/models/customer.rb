class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:orders,dependent: :destroy
  has_many:cart_items,dependent: :destroy
  has_many:shippings,dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :encrypted_password, presence: true

  def full_address
    '〒' + post_code + ' ' + address + ' '
  end
  def full_name
    last_name + first_name
  end
  def full_name
    self.last_name + self.first_name
  end
  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end
end