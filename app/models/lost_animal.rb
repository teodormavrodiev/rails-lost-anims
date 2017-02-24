class LostAnimal < ApplicationRecord
  belongs_to :city
  has_attachment :photos, maximum: 5
  validates :name, presence: true
  validates :owner, presence: true
  validates :owner_email, presence: true
  validates_associated :city
  validates :photos, presence: true
end
