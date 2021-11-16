class OrderItem < ApplicationRecord
  belongs_to:order
  belongs_to:item

  enum making_status:{impossible:0,production_waiting:1,producing:2,production_finish:3}
end
