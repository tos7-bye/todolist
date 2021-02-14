# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
  email: "tosoto1004@gmail.com",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@example.com"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end
