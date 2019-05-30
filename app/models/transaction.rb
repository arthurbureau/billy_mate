class Transaction < ApplicationRecord
  belongs_to :bill
  belongs_to :user

  after_validation :set_amount

  private

  def set_amount
    self.amount = bill.amount / bill.flat.users.count
  end
end
