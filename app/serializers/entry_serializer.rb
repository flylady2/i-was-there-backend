class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :category_id, :day_id
  belongs_to :category, :day
end
