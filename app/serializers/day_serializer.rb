class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :entries
  has_many :entries
end
