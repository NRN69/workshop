class Work < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # validates :img, present: true
  mount_uploader :img, ImgUploader
  belongs_to :user
end
