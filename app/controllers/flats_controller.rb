class FlatsController < ApplicationController
   # resources :flats, only: [:new, :create, :edit, :update, :destroy]


  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(set_flat_params)
    if @flat.save
      current_user.flat = @flat
      flash[:notice] = "Youpi! 🎉 tu viens de créer ta coloc!"
      redirect_to bills_path
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(set_flat_params)
      flash[:notice] = "Super! 🎉 tu viens de modifier les paramètres de ta coloc."
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    if current_user == @flat.user
      @flat.destroy
      flash[:alert] = "Tu viens de quitter ta coloc"
      redirect_to profile_path
    else
      flash[:alert] = "Tu n'es pas autorisé à faire cette action"
      redirect_to flat_path(@flat)
    end
  end

  private

  def set_flat_params
    params.require(:flat).permit(:name)
  end
end
