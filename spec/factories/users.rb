FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 6) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    noodle_id             { 1 }
    soup_id               { 1 }
    meat_id               { 1 }
    vegetable_id          { 1 }
    garlic_id             { 1 }
    oil_id                { 1 }
  end
end