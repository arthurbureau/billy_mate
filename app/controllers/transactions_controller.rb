class TransactionsController < ApplicationController
  def create

    @transaction = Transaction.new(transaction_params)
    # @transaction.user = User.find(params[:transaction][:user_id])
    # @transaction.bill = Bill.find(params[:transaction][:bill_id])

    if @transaction.save
      flash[:notice] = "Ton remboursement a été validé!"
      redirect_to bill_path(@transaction.bill, user: @transaction.user)
    else
      redirect_to bill_path(@transaction.bill)
            # render "bills/show"
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :bill_id)
  end
end
