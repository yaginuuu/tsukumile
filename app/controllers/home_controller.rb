class HomeController < ApplicationController
  def index
    location_id = 284860
    @medias = Instagram.tag_recent_media(URI.encode("笑顔"), {count: 10}) &&
              Instagram.location_recent_media(location_id)
  end

  def tweet
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def favorite_instagram
    result = {}
    fav_ary = []
    params[:img_id].delete!("https://instagram.com/p/")
    if cookies[:instagram_fav].present?
      if /&/ =~ cookies[:instagram_fav]
        fav_ary = cookies[:instagram_fav].split('&')
      else
        fav_ary << cookies[:instagram_fav]
      end
    end
    result[:star] = fav_ary.find{ |elem| elem == params[:img_id]} ? true : false
    if result[:star]
      fav_ary.delete(params[:img_id])
    else
      fav_ary.push(params[:img_id])
    end
    cookies[:instagram_fav] = fav_ary.uniq
    render :json => result
  end

  def favorite_twitter
    result = {}
    fav_ary = []
    if cookies[:twitter_fav].present?
      if /&/ =~ cookies[:twitter_fav]
        fav_ary = cookies[:twitter_fav].split('&')
      else
        fav_ary << cookies[:twitter_fav]
      end
    end
    result[:star] = fav_ary.find{ |elem| elem == params[:id]} ? true : false
    if result[:star]
      fav_ary.delete(params[:id])
    else
      fav_ary.push(params[:id])
    end
    cookies[:twitter_fav] = fav_ary.uniq
    render :json => result
  end
end
