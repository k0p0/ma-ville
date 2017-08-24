class ChangeDefaultToReport < ActiveRecord::Migration[5.1]
  def change
    change_column_default :reports, :priority_id, 2
    change_column_default :reports, :status_id, 1
  end
end
