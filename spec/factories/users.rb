FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"pass123"}
    password_confirmation {password}
    first_name            {'さとう' }
    last_name             {'たろう'} 
    first_kana            {'サトウ'}
    last_kana             {'タロウ'}
    birthday              {Faker::Date.birthday}
  end
end