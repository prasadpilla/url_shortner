class CreateUrlMaps < ActiveRecord::Migration
  def change
    create_table :url_maps do |t|
      t.string :hex_code
      t.string :actual_url
      t.integer :redirect_count
      t.datetime :expiry

      t.timestamps null: false
    end
  end
end
