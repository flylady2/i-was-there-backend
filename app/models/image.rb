class Image < ApplicationRecord
  belongs_to :day
  validates :caption, presence: true
end
