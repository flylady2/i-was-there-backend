class Entry < ApplicationRecord
  belongs_to :category
  belongs_to :day
  validates :content, presence: true
end
