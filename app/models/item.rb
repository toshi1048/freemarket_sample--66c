class Item < ApplicationRecord
  belongs_to :category
  belongs_to :bland
  has_many :images
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  enum category_l: {"----":0,"レディース":1,"メンズ":2,"ベビー・キッズ":3,"コスメ・香水・美容":4,"インテリア・住まい・小物":5,"本・音楽・ゲーム":6,"おもちゃ・ホビー・グッズ":7,"家電・スマホ・カメラ":8,"スポーツ・レジャー":9,"ハンドメイド":10,"チケット":11,"自動車・オートバイ":12,"その他":13}
  enum sales_status: {"出品中":1,"公開停止":2,"取引中":3,"売却済み":4}

  scope :recent, -> {order('id DESC').limit(4)}
end
