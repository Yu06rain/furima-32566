FactoryBot.define do
  factory :item do
    name            {"名前"}
    description     {"説明"}
    price           {2000}
    category_id       {1}
    condition_id      {1}
    postage_id        {1}
    region_id         {1}
    shipping_data_id  {1}
    after(:build) do |item|
      item.image.attach(io: File.open('test/fixtures/sample1.png'), filename: 'sample1.png', content_type: 'image/png')
    end
    association :user
  end
end
