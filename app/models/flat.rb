class Flat < ApplicationRecord
  ROOMIES = [1, 2, 3, 4, 5, 6]

  has_many :users
  has_many :bills, dependent: :destroy

  validates :name, presence: true

  before_create :set_token

  private

  def set_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless Flat.where(token: token).exists?
    end
  end

end
