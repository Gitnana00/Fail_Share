class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65535 }
  validates :tags_id, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
