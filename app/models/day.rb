class Day < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :categories, through: :entries
  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :entries, allow_destroy: true
  accepts_nested_attributes_for :image, allow_destroy: true
  validates :name, presence: true
  validates :date, presence: true

  def self.search_by_date(date)
    Day.where(date: date)
  end

end
