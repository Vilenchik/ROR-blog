class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :summary, :body, presence: true #проверка на зоплненые поля
  belongs_to :user
end
