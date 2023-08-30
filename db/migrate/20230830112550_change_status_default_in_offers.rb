class ChangeStatusDefaultInOffers < ActiveRecord::Migration[7.0]
  def change
    change_column :offers, :status, :string, default: 'pending'
  end
end
