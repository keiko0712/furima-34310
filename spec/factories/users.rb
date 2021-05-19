FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaaaa1'}
    encrypted_password    {password}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_ruby      {'ヤマダ'}
    first_name_ruby       {'タロウ'}
    birthday              {'1930-1-1'}
  end
end