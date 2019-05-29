class Transaction < ApplicationRecord
  belongs_to :bill
  belongs_to :user

  monetize :amount_cents

  after_initialize :set_amount


  private

  def set_amount
    return unless bill
    self.amount = bill.amount / bill.flat.users.count
  end
end
