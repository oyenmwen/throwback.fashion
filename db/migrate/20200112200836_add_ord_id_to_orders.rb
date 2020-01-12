class AddOrdIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :ord_id, :string
  end
end
