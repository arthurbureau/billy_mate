class Bill < ApplicationRecord
  CATEGORY = ['Electricité', 'Internet', 'Gaz', 'Eau', 'Offres TV', 'Ass. Habit°', 'Canal +']

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
  # validates :category, uniqueness: { scope: :user, message: "should happen once per year" }

  after_create :next_bills, if: :first?

  def first?
    self.first
  end

  def next_bills
    10.times do |i|
      i = i + 1
      new_bill = self.dup
      new_bill.payment_date += i.month
      new_bill.first = false
      new_bill.save
    end
  end
end
