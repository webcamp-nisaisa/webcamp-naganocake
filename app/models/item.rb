class Item < ApplicationRecord
  attachment:image
  
  has_many:cart_items,dependent: :destroy
  has_many:order_items,dependent: :destroy
  belongs_to:genre
  
  def add_tax_price
      (self.price * 1.1).round
  end
end
