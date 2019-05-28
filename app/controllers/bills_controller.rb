class BillsController < ApplicationController
  # before_action :find_flat, only: [:new, :create]

  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new
    @bill.flat = current_user.flat
    @flat = current_user.flat
  end

  def create
    @user_payeur = User.find(params[:bill][:user].to_i)
    @bill = Bill.new(set_bill_params)
    @bill.flat = current_user.flat
    @bill.user = @user_payeur
    if @bill.save
      flash[:notice] = "Yay! 🎉 tu as ajouté une nouvelle facture."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  # def find_flat
  #   @flat = Flat.find(params[:flat_id])
  # end

  def set_bill_params
    params.require(:bill).permit(:category, :provider, :amount, :payment_date, :contract_picture)
  end
end
