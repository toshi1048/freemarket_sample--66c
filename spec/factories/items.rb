FactoryBot.define do
  factory :item do
    buyer_id               {nil}
    saler_id               {1}
    name                  {"LGTM祈願のマフラー"}
    price                 {"1000"}
    detail                 {"暖かい"}
    category_id            {"1"}
    brand_id               {"1"}
    shipping_date          {"test"}
    condition               {"1"}
    delivery_method         {"1"}
    postage                 {"1"}
    # images {[
      # {File.new("#{Rails.root}/app/assets/images/uploaded.jpg")}
      # FactoryBot.build(:image, product: nil)  #itemと同時にimage作成
    # ]}
    association :saler, factory: :user
    association :category
    association :brand
  end
end