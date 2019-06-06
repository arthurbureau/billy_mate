class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      flash[:notice] = "💸 Ton remboursement a été validé!"
      redirect_to bills_path(query_month: @transaction.bill.payment_date.month)
    else
      redirect_to bills_path(query_month: @transaction.bill.payment_date.month)
    end
  end

  def lydia_request
    url = 'https://homologation.lydia-app.com/api/payment/init.json'
    params = {
      provider_token: "5cf67f0ac45e8598414133",
      recipient: "+33681101126",
      amount: "12,3",
      currency: "EUR",
      payer_info: "+33763304914"
    }
    result = RestClient.post(url, params)
    puts result
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :bill_id)
  end
end
