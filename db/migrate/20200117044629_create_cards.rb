class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.bigint    :card_number, null: false
      t.integer    :year, null: false
      t.integer    :momth, null: false
      t.integer    :security_number, null: false
      t.references :user
      
      t.timestamps
    end
  end
end
