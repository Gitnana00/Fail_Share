class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :private, inclusion: { in: [true, false] }
  validates :anonymous, inclusion: { in: [true, false] }

  def self.ransackable_attributes(_auth_object = nil)
    %w[title content created_at updated_at user_id]
  end

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end
end
