class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true
      t.integer :qty

      t.timestamps
    end
  end
end
