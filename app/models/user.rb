class User < ApplicationRecord

  has_many :days, dependent: :destroy
  has_many :entries, through: :days
  has_many :images, through: :days
  validates :username, uniqueness: { case_sensitive: false}
  has_secure_password
end
