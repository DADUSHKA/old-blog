FactoryGirl.define do
  factory :user do
    first_name { Factory.next :name }
    last_name  { Factory.next :name }
    email { Factory.next :email }
    password 'pass'
    password_confirmation 'pass'
    confirmation_token { Factory.next :string }
    auth_token { Factory.next :string }
  end

  factory :waiting_email_confirmation_user, :parent => :user do
    state 'waiting_email_confirmation'
  end

  factory :active_user, :parent => :user do
    state 'active'
  end

  factory :admin, :parent => :user do
    admin true
  end
end
