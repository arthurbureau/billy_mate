class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      flash[:notice] = "Ton remboursement a été validé!"
      redirect_to bills_path
    else
      redirect_to bills_path

    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :bill_id)
  end
end
