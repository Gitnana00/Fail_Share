class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :images
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65535 }
  validates :private, inclusion: { in: [true, false] }
  validates :anonymous, inclusion: { in: [true, false] }

end
