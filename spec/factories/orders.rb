FactoryBot.define do
  factory :order do
    postal_code      {'123-5678'}
    shipping_area_id {2}
    municipality     {'横浜市緑区'}
    address          {'青山1-1-1'}
    phone_number   {'12345678901'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
