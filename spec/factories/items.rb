FactoryBot.define do
  factory :item do
    buyer_id               {"1"}
    saler_id               {nil}
    name                  {"LGTM祈願のマフラー"}
    price                 {"1000"}
    detail                 {"暖かい"}
    category_id            {"1"}
    brand_id               {"1"}
    shipping_date          {"test"}
    condition               {"1"}
    delivery_method         {"1"}
    postage                 {"1"}
    images {[
      # {File.new("#{Rails.root}/app/assets/images/uploaded.jpg")}
      # FactoryBot.build(:image, product: nil)  #itemと同時にimage作成
    ]}
  end
end