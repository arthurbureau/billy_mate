class Bill < ApplicationRecord
  CATEGORY = ['Electricité', 'Internet', 'Gaz', 'Eau', 'Netflix', 'Being', 'Canal+', 'Offres TV']
  belongs_to :user
  belongs_to :flat
  has_many :transactions, dependent: :destroy

  monetize :amount_cents

end
