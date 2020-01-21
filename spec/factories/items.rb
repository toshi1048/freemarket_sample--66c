FactoryBot.define do
  factory :item do
    user_id               {"1"}
    name                  {"LGTM祈願のマフラー"}
    price                 {"1000"}
    category_id            {"1"}
    brand_id               {"1"}
    shipping_date          {"test"}
    condition               {"1"}
    delivery_method         {"1"}
    postage                 {"1"}
    images {[
      FactoryBot.build(:image, product: nil)  #itemと同時にimage作成
    ]}
    user
  end
end