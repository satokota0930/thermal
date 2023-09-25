class Ball < ApplicationRecord
# 追記ここから
mount_uploader :image, ImageUploader
mount_uploader :video, VideoUploader

# 追記ここまで
belongs_to :user
has_many :likes, dependent: :destroy
has_many :liked_users, through: :likes, source: :user

end
