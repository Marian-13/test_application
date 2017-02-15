class HomeController < ApplicationController
  def index
    if user_signed_in_via_instagram?
      redirect_to photos_path
    end
  end
end
