class ProfilesController < ApplicationController
  def my_profile
    @bills = current_user.bills
    if params[:query_month].present?
      @month = params[:query_month].to_i
      @month_name = Date::MONTHNAMES[params[:query_month].to_i]
    else
      @month = DateTime.now.month
      @month_name = DateTime.now.strftime('%B')
    end
    @bills_month = current_user.bills.select { |bill| bill.payment_date.month == @month }

  end

end
