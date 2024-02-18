# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :post

  validates :url, allow_blank: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
