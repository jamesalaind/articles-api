require 'faker'

FactoryBot.define do
  factory :article do |f|
    f.title { Faker::Movie }
    f.description { Faker::Quote }
  end
end