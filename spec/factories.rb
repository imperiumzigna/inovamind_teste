FactoryBot.define do
  factory :quote do
    
  end
  
    factory :user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      password { "123456" }
      password_confirmation { "123456" }
    end
end