FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"aaa@gmail.com"}
    password              {"00000a"}
    password_confirmation {"00000a"}
    last_name             {"ぜんかく"}
    first_name            {"ぜんかく"}
    last_name_kana        {"ゼンカクカナ"}
    first_name_kana       {"ゼンカクカナ"}
    birth_day             {"2020-01-01"}
  end
end
