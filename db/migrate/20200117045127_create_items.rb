class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name, null:false, index: true
      t.integer     :price, null: false
      t.string      :shipping_date, null: false
      t.string      :condition, null: false
      t.string      :delivery_method, null: false
      t.string      :region, null: false
      t.string      :postage, foreign_key: true
      t.integer     :saler_id
      t.integer     :buyer_id
      t.references  :category, foreign_key: true
      t.references  :brand, foreign_key: true

      t.timestamps
    end
  end
end
