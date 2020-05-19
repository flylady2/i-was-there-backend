class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :entries
end
