class UsersController < ApplicationController
  # def quit_a_flat
  #   current_user.flat = nil
  #   redirect_to root_path
  # end

  def update
    @flat = Flat.find(params[:flat_id])
    if current_user.flat_id.present?
      flash[:notice] = "Tu fais déjà parti d'une coloc!"
      redirect_to flat_path(@flat)
    else
      current_user.flat = @flat
      if current_user.save!
        flash[:notice] = "Bienvenue dans ta coloc!"
        redirect_to bills_path
      else
        redirect_to flat_path(@flat)
      end
    end
  end
end
