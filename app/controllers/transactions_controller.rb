class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      flash[:notice] = "💸 Ton remboursement a été validé!"
      @lydia_url = lydia_request(@transaction.bill.user.phone_number, @transaction.bill.user.first_name, @transaction.amount.to_s, @transaction.user.phone_number)
      respond_to do |format|
        format.html { redirect_to bills_path(query_month: @transaction.bill.payment_date.month) }
        format.js  # <-- will render `app/views/transcations/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to bills_path(query_month: @transaction.bill.payment_date.month) }
        format.js  # <-- idem
      end
    end
  end

  private

  def lydia_request(recipient, payment_collector, amount, payer_info)
    url = 'https://homologation.lydia-app.com/api/payment/init.json'
    params = {
      provider_token: "5cf67f0ac45e8598414133",
      recipient: recipient, #@transaction.bill.user.phone_number
      payment_collector: payment_collector, #@transaction.bill.user.first_name
      amount: amount, #@transaction.amount.to_s
      currency: "EUR",
      payer_info: payer_info, #@transaction.user.phone_number
    }

    result = RestClient.post(url, params)
    response = JSON.parse result.body
    response['data']['url']
  end

  def transaction_params
    params.require(:transaction).permit(:user_id, :bill_id)
  end
end
