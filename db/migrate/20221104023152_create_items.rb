class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,           null: false
      t.text    :content 
      t.string  :material,       null: false
      t.text    :centimeter,     null: false
      t.integer :price,          null: false
      t.integer :reservation_id, null: false
      t.integer :size_id,        null: false
      t.timestamps
    end
  end
end
