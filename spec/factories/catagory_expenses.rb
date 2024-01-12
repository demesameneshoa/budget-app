FactoryBot.define do
  factory :catagory_expense do
    association :category
    association :expense
  end
end
