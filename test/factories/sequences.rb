FactoryGirl.define do
  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :integer do |n|
    n
  end

  sequence :name do |n|
    "name-#{n}"
  end

  sequence :string do |n|
    "string-#{n}"
  end
end
