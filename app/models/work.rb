# frozen_string_literal: true

class Work < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }

  mount_uploader :img, ImgUploader

  has_many_attached :documents
  belongs_to :user
end
