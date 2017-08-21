class CreateFurnitures < ActiveRecord::Migration[5.1]
  def change
    create_table :furnitures do |t|
      t.string :name

      t.timestamps
    end
  end
end
