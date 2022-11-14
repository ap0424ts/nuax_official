class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true 
      t.integer    :shipping_id
      t.references :cart, foreign_key: true
      t.timestamps
    end
  end
end
