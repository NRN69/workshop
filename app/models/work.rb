# frozen_string_literal: true

class Work < ApplicationRecord
  mount_uploader :img, ImgUploader
  has_many_attached :files

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
  validates :files,
            content_type: {
                      in: [
                            'image/jpeg',
                            'application/pdf','application/msword','application/vnd.ms-excel',
                            'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
                          ],
                 message: I18n.t('errors.messages.content_type_invalid')
                          },
                    size: { between: 1.kilobyte..100.megabytes , message: I18n.t('errors.messages.file_size_out_of_range') },
                   limit: { max: 3, massage: I18n.t('errors.messages.limit_out_of_range') }

  belongs_to :user
end
