class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :entries, :image
  has_many :entries
  has_one :image
end
