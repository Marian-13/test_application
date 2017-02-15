class InstagramController < ApplicationController
  def connect
    if user_signed_in_via_instagram?
      redirect_to photos_path, notice: 'You have already connected to Instagram'
    else
      redirect_to Instagram.authorize_url(redirect_uri: callback_url)
    end
  end

  def callback
    if user_signed_in_via_instagram?
      flash[:notice] = 'You have already connected to Instagram'
    else
      response = Instagram.get_access_token(params[:code], redirect_uri: callback_url)
      session[:instagram_access_token] = response.access_token
    end

    redirect_to photos_path
  end

  def disconnect
    session[:instagram_access_token] = nil
    redirect_to root_url
  end

  private

    def callback_url
      "#{root_url}instagram/callback"
    end
end
