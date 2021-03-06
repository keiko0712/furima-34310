FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'aaaaa1'}
    password_confirmation {password}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_ruby      {'ヤマダ'}
    first_name_ruby       {'タロウ'}
    birthday              {'1930-1-1'}
  end
end