# frozen_string_literal: true

class Work < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
  # validates :img, present: true
  mount_uploader :img, ImgUploader
  belongs_to :user
end
