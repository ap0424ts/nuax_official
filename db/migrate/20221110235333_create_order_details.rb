class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.integer    :quantity, default: 0
      t.references :item,     null: false, foreign_key: true
      t.references :order,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
