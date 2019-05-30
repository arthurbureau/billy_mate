class UsersController < ApplicationController
  def update
    @flat = Flat.find_by(token: user_params[:token])

    if current_user.flat_id.present?
      flash[:notice] = "Tu fais déjà parti d'une coloc!"
      redirect_to flat_path(@flat)
    else
      current_user.flat = @flat
      if @flat && current_user.save
        flash[:notice] = "Bienvenue dans ta coloc!"
        redirect_to bills_path
      else
        flash[:alert] = "Votre lien ne fonctionne pas"
        render "flats/join_flat"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:token)
  end

end
