class Day < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :categories, through: :entries
  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :entries, allow_destroy: true
  accepts_nested_attributes_for :image, allow_destroy: true
end
