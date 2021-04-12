class Customer < ApplicationRecord
  validates :name, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true

  belongs_to :user
end
