FactoryGirl.define do
  factory :post do
    title { Factory.next :string }
    body  { Factory.next :string }
  end
end
