# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should belong_to :user }
  it {
    should validate_content_type_of(:files)
      .allowing('image/jpeg', 'application/pdf', 'application/msword', 'application/vnd.ms-excel',
                'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
  }
  it { should validate_content_type_of(:files).rejecting('text/plain', 'text/xml') }
end