class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :bill, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :amount
      t.date :payment_date

      t.timestamps
    end
  end
end
