class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :category_id, :category, :day_id, :day
  belongs_to :category
end
