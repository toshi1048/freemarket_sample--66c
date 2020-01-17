class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :zipcode
      t.string     :prefecture
      t.string     :first_address
      t.string     :second_address
      t.string     :third_address
      t.references :user

      t.timestamps
    end
  end
end
