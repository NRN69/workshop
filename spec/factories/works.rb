# frozen_string_literal: true

FactoryBot.define do
  factory :work do
    title { FFaker::Lorem.sentence }
    body  { FFaker::Lorem.sentence }
  end
end
