class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.date :resolution_date
      t.date :submit_date
      t.string :address
      t.float :report_latitude
      t.float :report_longitude
      t.string :picture
      t.text :description
      t.references :degradation, foreign_key: true
      t.references :furniture, foreign_key: true
      t.references :city, foreign_key: true
      t.references :priority, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
