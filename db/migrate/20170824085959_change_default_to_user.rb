class ChangeDefaultToUser < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :city_id, 1
  end
end
