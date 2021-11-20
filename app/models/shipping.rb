class Shipping < ApplicationRecord
  belongs_to:customer

  def full_address
    '〒' + post_code + ' ' + address + ' ' + name
  end
end
