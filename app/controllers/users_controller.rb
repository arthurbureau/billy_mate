class UsersController < ApplicationController
  # def quit_a_flat
  #   current_user.flat = nil
  #   redirect_to root_path
  # end

  def update
    @flat = Flat.find_by(token: user_params[:token])

    if current_user.flat_id.present?
      flash[:notice] = "Tu fais déjà parti d'une coloc! "
      redirect_to flat_path(@flat)
    else
      current_user.flat = @flat
      if @flat && current_user.save
        flash[:notice] = "😎 Bienvenue dans ta coloc!"
        redirect_to bills_path
      else
        flash[:alert] = "Le lien ne fonctionne pas."
        render "flats/join_flat"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:token)
  end

end
