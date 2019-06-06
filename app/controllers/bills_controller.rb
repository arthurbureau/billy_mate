require 'date'

class BillsController < ApplicationController
  def display_categories
    @bills = current_user.flat.bills
    @flat = current_user.flat
    @bill_gaz_present = Bill.find_by(flat: @flat, category: 'Gaz').present?
    @bill_internet_present = Bill.find_by(flat: @flat, category: 'Internet').present?
    @bill_elec_present = Bill.find_by(flat: @flat, category: 'Electricité').present?
  end

  def index
    params[:query_month]
    redirect_to root_path unless current_user.flat
    if params[:query_month].present?
      @month = params[:query_month].to_i
      @month_name = Date::MONTHNAMES[params[:query_month].to_i]
    else
      @month = DateTime.now.month
      @month_name = DateTime.now.strftime('%B')
    end
    @bills = current_user.flat.bills.select { |bill| bill.payment_date.month == @month }
    @bills_carousel = current_user.flat.bills.group_by { |bill| bill.payment_date.month }

  end

  def show
    if params[:user].present?
      @user = User.find(params[:user])
      @bill = Bill.find(params[:id])

      if @bill.user == @user
        flash[:alert] = "🥴 Tu ne peux pas te rembourser toi-même."
        redirect_to bills_path
      else
        @transaction = Transaction.new(bill: @bill, user: @user)
        @user_already_paid = Transaction.find_by(user: @user, bill: @bill).present?
      end
    else
      redirect_to bills_path
    end
  end

  def new
    @category = params[:category]
    @bill = Bill.new
    @bill.flat = current_user.flat
    @flat = current_user.flat
  end

  def create
    @category = params[:bill][:category]
    @bill = Bill.new(set_bill_params)
    @bill.flat = current_user.flat
    @bill.first = true
    @bill.user = User.find(params[:bill][:user].to_i) if params[:bill][:user].present?
    # @bill = current_user.flat.bills.new(set_bill_params)
    if @bill.save
      flash[:notice] = "🎉 Tu as ajouté une nouvelle facture. "
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @bill = Bill.find(params[:id])
    if current_user == @bill.user
    else
      flash[:alert] = "🧐 Seul le titulaire du contrat peut modifier une facture."
      redirect_to profile_path
    end
  end

  def update
    @bill = Bill.find(params[:id])
    if @bill.update(set_bill_params)
      flash[:notice] = "🎉 Tu as modifié avec succès la facture. "
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    if current_user == @bill.user
      @bill.destroy
      flash[:alert] = "😱 Tu viens de supprimer une facture."
      redirect_to profile_path
    else
      flash[:alert] = "🧐 Seul le titulaire du contrat peut supprimer une facture."
      redirect_to profile_path
    end
  end

  private

  def set_bill_params
    params.require(:bill).permit(:category, :provider, :amount_cents, :amount, :payment_date, :contract_picture, :user_id)
  end
end
