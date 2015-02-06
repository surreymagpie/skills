FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Smith"
    password "secret"
    password_confirmation "secret"
    email "john.smith@example.com"
    dept "Sales"
    extn "1234"
    admin false

    factory :admin do
      email "admin@example.com"
      admin true
    end
  end


end
