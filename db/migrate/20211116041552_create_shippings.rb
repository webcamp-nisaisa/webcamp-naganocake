class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :customer_id,null: false
      t.string :post_code,null: false
      t.string :address,null: false
      t.string :name,null: false

      t.timestamps
    end
  end
end
