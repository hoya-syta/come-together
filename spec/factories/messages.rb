FactoryBot.define do
  factory :message do
    content  { 'aaa' }
    association :user
    association :post
  end
end
