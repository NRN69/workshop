# frozen_string_literal: true

FactoryBot.define do
  factory :blog do
    title { FFaker::Lorem.word }
    body  { FFaker::Lorem.sentence }
    association :user, factory: :user
  end
end
