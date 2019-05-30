class ProfilesController < ApplicationController
  def my_profile
    @bills = current_user.bills
  end

end
