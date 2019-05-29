class Bill < ApplicationRecord
  CATEGORY = ['Electricité', 'Internet', 'Gaz', 'Eau', 'Netflix', 'Being', 'Canal+', 'Offres TV']
  belongs_to :user
  belongs_to :flat
  has_many :transactions, dependent: :destroy

  monetize :amount_cents
  mount_uploader :contract_picture, PhotoUploader

  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :provider, presence: true
  validates :amount_cents, presence: true
  validates :payment_date, presence: true
  validates :user_id, presence: true

end
