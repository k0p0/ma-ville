class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.date :submit_message_date
      t.text :note
      t.references :report, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
