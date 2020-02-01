FactoryBot.define do
  factory :package do
    name { FFaker::Name.name }
    title { FFaker::Name.name.dasherize }
    description { FFaker::Lorem.paragraph }
  end
end
