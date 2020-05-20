class Day < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :categories, through: :entries
end
