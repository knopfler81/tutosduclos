FactoryGirl.define do
    factory :user do
    sequence(:email) { |n| "#{n}.#{Faker::Internet.email}" }
    nickname { Faker::Internet.user_name }
    password 'password'
    admin false
  end

  factory :category do
    name "The category"
    description "That's a fake description...."
  end

  factory :tuto do
    title "A title"
    content "A Content"
    description "The Super description"
    category
  end


  factory :review do
    content "Awsome"
    rating 5
    tuto
  end
end
