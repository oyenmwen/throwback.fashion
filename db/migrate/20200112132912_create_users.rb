class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.string :email
      t.string :address
      t.string :address_two
      t.string :zip
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
