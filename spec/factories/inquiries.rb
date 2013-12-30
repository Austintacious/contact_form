# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquiry do
    first_name "Austin"
    last_name "Winslow"
    email "blah@blah.com"
    subject "blah"
    description "blahblahblah"
  end
end
