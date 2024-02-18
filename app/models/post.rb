# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :private, inclusion: { in: [true, false] }
  validates :anonymous, inclusion: { in: [true, false] }

  def self.ransackable_attributes(_auth_object = nil)
    # 検索に含めたい属性を配列で指定する
    %w[title content created_at updated_at tags_id user_id]
  end
end
