# frozen_string_literal: true

FactoryBot.define do
    factory :company do
      name { Faker::Name.name }
      city { Faker::Address.city }
      state { Faker::Address.state }
      founded_on { Date.yesterday }
      description { '560102' }
    end

    trait :with_founders do
        after(:create) do |company|
          create_list(:founder, 2, company: company) 
        end
      end
  end