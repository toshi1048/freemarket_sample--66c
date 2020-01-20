class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references  :user
      t.integer     :card_number, null: false
      t.integer     :year, null: false
      t.integer     :momth, null: false
      t.integer     :security_number, null: false
      t.timestamps
    end
  end
end


# マイグレーションファイルの書き換えでエラーが起きたら
# 一度元に戻す必要がある・
# ローカル環境でマイグレーションファイルを立ち上げてないため
# 問題ないと見て変更したが不安

