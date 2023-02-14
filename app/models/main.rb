# frozen_string_literal: true

class Main < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
end
