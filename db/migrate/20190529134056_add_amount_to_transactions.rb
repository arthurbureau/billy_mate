class AddAmountToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_monetize :transactions, :amount, currency: { present: false }
  end
end
