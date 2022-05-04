class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,               null: false
      t.text :product_description,               null: false
      t.integer :category_id,               null: false
      t.integer :condition_id,               null: false
      t.integer :postage_id,               null: false
      t.integer :area_id,               null: false
      t.integer :number_of_days_id,               null: false
      t.integer :price,               null: false
      t.references :user,               null: false, foreign_key: true


      t.timestamps
    end
  end
end
