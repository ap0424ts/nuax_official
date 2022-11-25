class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :season,           null: false
      t.timestamps
    end
  end
end
