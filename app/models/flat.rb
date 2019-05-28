class Flat < ApplicationRecord
  ROOMIES = [1, 2, 3, 4, 5, 6]

  has_many :users
  has_many :bills, dependent: :destroy
end
