# frozen_string_literal: true

FactoryBot.define do
  factory name :post do
    title { Faker::Lorem.sentence(word_count: 10) }
    body  { Faker::Lorem.sentence(word_count: 10).downcase }
    img   { Faker::Lorem.sentence(word_count: 10).downcase }
  end
end
