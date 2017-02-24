class Comment < ApplicationRecord
  belongs_to :lost_animal
  validates :description, presence: true
end
