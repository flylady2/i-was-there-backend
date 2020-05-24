class Day < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :categories, through: :entries
  accepts_nested_attributes_for :entries, allow_destroy: true
end
