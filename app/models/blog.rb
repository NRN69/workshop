# frozen_string_literal: true

class Blog < ApplicationRecord
  mount_uploader :img, ImgUploader
  mount_uploader :file, FileUploader

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }

  belongs_to :user
end
