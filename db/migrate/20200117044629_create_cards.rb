class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer    :card_number
      t.integer    :year
      t.integer    :momth
      t.integer    :security_number
      t.references :user
      
      t.timestamps
    end
  end
end
