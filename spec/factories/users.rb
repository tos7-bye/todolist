FactoryBot.define do
  factory :user do
    name                 { "test" }
    email                 { "test@gmail.com" }
    password              { "111111" }
    password_confirmation { "111111" }
  end

  factory :user_hoge, class: "User" do
    name                 { "hogehoge" }
    email                  { "hogehoge@example.com" }
    password           { "hogehoge" }
    password_confirmation { "hogehoge" }
  end
end