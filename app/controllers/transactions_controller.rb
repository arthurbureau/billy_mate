class TransactionsController < ApplicationController
  def create
    @bill = Bill.find(params[:bill_id])
    @transaction = @bill.transactions.new(transaction_params)

    if @transaction.save
      flash[:notice] = "Youpi! 🎉 tu viens de créer ta coloc!"
      redirect_to bill_path(@bill)
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id)
  end
end
