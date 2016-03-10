class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.text :image
      t.integer :status
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
