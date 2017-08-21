class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :zip_code
      t.integer :insee_code
      t.float :city_latitude
      t.float :city_longitude
      t.integer :population
      t.float :density
      t.float :area
      t.string :mayor
      t.string :region
      t.string :department
      t.string :council_address
      t.string :council_phone
      t.string :council_website
      t.string :council_email

      t.timestamps
    end
  end
end
