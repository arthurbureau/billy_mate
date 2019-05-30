class Transaction < ApplicationRecord
  belongs_to :bill
  belongs_to :user
  validates :user_id, uniqueness: { scope: :bill_id, message: "tu as déjà payé" }
  monetize :amount_cents

  after_initialize :set_amount
  before_save :set_payment_date

  private

  def set_amount
    return unless bill
    self.amount = bill.amount / bill.flat.users.count
  end

  def set_payment_date
    return unless bill
    self.payment_date = Time.now
  end
end
