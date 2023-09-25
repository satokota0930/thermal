class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tweets , dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_balls, through: :likes, source: :ball
         def already_liked?(ball)
          self.likes.exists?(ball_id: ball.id)
         end 
         has_many :balls, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
         validates :name, presence: true #追記
         validates :profile, length: { maximum: 200 } #追記
         mount_uploader :image, ImageUploader
end
