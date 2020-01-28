class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.string    :phone_number, null:false, unique: true
      t.references :user

      t.timestamps
    end
  end
end
