class ProfilesController < ApplicationController
  def my_profile
    @bills = current_user.bills
  end

  def join_flat
  end

end
