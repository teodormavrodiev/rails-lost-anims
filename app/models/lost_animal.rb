class LostAnimal < ApplicationRecord
  belongs_to :city
  has_many :comments
  has_attachments :photos, maximum: 5
  validates :name, presence: true
  validates :owner, presence: true
  validates :owner_email, presence: true
  validates_associated :city
  validates :photos, presence: true
end
