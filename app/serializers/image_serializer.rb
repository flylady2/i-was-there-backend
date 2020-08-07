class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :caption, :day_id

end
