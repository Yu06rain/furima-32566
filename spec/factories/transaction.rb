FactoryBot.define do
  factory :transaction do
    postal_code     { '123-4567' }
    region_id       { 1 }
    municipality    { '大阪府' }
    address         { '1-1' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end