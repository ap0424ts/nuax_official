class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :last_name,    null: false
      t.string     :first_name,   null: false
      t.string     :post_code,    null: false
      t.string     :state,        null: false
      t.string     :city,         null: false
      t.string     :addres,       null: false
      t.string     :building
      t.string     :phone_number, null: false
      t.references :order,        null: false, foreign_key: true 
      t.timestamps
    end
  end
end
