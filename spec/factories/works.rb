# frozen_string_literal: true

FactoryBot.define do
  factory :work do
    title { FFaker::Lorem.word }
    body  { FFaker::Lorem.sentence(10) }
    association :user, factory: :user
  end
end
