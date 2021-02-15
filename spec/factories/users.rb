FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 { 'test@mail.com' }
    password              { 'aa3456' }
    password_confirmation { password }
    last_name             { '田中' }
    last_name_kana        { 'タナカ' }
    first_name            { '三郎' }
    first_name_kana       { 'サブロウ' }
    birthday              { '1950-01-01' }
    gender_id             { '2' }
    prefecture_id         { '2' }
    profession_id         { '2' }
    age_id                { '2' }
  end
end
