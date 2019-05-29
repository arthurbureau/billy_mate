class AddAmountToBills < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bills, :amount, currency: { present: false }
  end
end
