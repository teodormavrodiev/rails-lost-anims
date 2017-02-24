class City < ApplicationRecord
  has_many :lost_animals
  has_attachment :photo
  validates :photo, presence: true
  validates :name, presence: true, uniqueness: true
end
