class ChangeColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :reports, :priority_id, nil
    change_column_default :reports, :status_id, nil
  end
end
