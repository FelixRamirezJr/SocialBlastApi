class SentBlast < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
  mount_uploader :picture, ImageUploader
  
end
