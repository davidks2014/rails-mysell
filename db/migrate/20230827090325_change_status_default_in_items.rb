class ChangeStatusDefaultInItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :status, :string, default: 'available'
  end
end
