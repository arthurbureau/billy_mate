class BillsController < ApplicationController
  def display_categories
  end

  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @category = params[:category]
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
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @bill = Bill.find(params[:id])
    if current_user == @bill.user
    else
      flash[:alert] = "Seule le titulaire du contrat peut modifier une facture"
      redirect_to profile_path
    end
  end

  def update
    @bill = Bill.find(params[:id])
    if @bill.update(set_bill_params)
      flash[:notice] = "Yay! 🎉 you have successfully udpate your bill."
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    if current_user == @bill.user
      @bill.destroy
      flash[:alert] = "Tu viens de supprimer une facture"
      redirect_to profile_path
    else
      flash[:alert] = "Seule le titulaire du contrat peut supprimer une facture"
      redirect_to profile_path
    end
  end

  private

  def set_bill_params
    params.require(:bill).permit(:category, :provider, :amount, :payment_date, :contract_picture)
  end
end
