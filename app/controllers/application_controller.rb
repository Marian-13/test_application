class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in_via_instagram?
    !!session[:instagram_access_token]
  end
  helper_method :user_signed_in_via_instagram?

  def authorize_user
    redirect_to root_path unless user_signed_in_via_instagram?
  end

  private

    def instagram_client
      Instagram.client(access_token: session[:instagram_access_token])
    end
end
