class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :caption, :day_id
  #belongs_to :category
  #belongs_to :day
end
