# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
  # validates :img, present: true
  mount_uploader :img, ImgUploader
  belongs_to :user
  attr_accessor :user_id
end
