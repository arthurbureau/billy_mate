class ProfilesController < ApplicationController
  def show
    @bills = current_user.bills
  end
end
