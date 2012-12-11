# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :volunteer do
  	id 1
    last_name 'Billy'
    first_name 'Billy'
    email 'Billy@example.com'
    password 'please'
    password_confirmation 'please'
  end
end
