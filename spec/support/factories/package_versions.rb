FactoryBot.define do
  factory :package_version do
    association :package, factory: :package, strategy: :create
    version { FFaker::SemVer.next }
    publication { FFaker::Time.date }
  end
end
