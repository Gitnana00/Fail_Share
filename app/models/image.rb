class Image < ApplicationRecord
  belongs_to :post

  validates :url, allow_blank: true, format: { with: URI.regexp(%w[http https]) }
end
