class AddProductImgToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_img, :string
  end
end
