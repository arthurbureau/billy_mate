class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :transactions, dependent: :destroy
end
