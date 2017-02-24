class City < ApplicationRecord
  has_many :lost_animals
  has_attachment :photo
end
