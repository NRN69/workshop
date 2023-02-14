# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Work, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  # pending "add some examples to (or delete) #{__FILE__}"
end
