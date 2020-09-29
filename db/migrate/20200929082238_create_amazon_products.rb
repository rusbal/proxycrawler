class CreateAmazonProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :amazon_products do |t|
      t.string :name, null: false
      t.string :price_symbol
      t.decimal :price, precision: 8, scale: 2, null: false
      t.decimal :price_crossed_out, precision: 8, scale: 2
      t.string :image_url
      t.string :size_base
      t.decimal :rating, precision: 3, scale: 2
      t.integer :review_count, default: 0

      t.timestamps
    end
  end
end
