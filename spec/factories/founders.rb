# frozen_string_literal: true

FactoryBot.define do
    factory :founder do
      name { Faker::Name.name }
      title { Faker::Name.name }
      company
    end
  end