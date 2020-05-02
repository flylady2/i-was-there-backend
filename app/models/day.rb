class Day < ApplicationRecord
  has_many :entries, dependent: :destroy
end
