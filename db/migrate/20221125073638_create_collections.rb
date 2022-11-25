class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.integer    :season_id     , null: false
      t.timestamps
    end
  end
end
