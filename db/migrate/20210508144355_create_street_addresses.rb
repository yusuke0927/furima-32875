class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string     :postal,              null: false
      t.string     :municipality,        null: false
      t.string     :address,             null: false
      t.string     :building_name,       null: false
      t.string     :phone_number,        null: false
      t.integer    :area_id,             null: false
      t.references :purchase,            null: false, foreign_key: true
      t.timestamps 
    end
  end
end
