class HomeController < ApplicationController
  def index
    location_id = 284860
    @medias = Instagram.tag_recent_media(URI.encode("笑顔")) &&
              Instagram.location_recent_media(location_id) ||
              Instagram.tag_recent_media(URI.encode("元気")) &&
              Instagram.location_recent_media(location_id)
  end

  def favorite
    result = {}
    fav_ary = []
    params[:img_id].delete!("https://instagram.com/p/")
    if cookies[:fav].present?
      if /&/ =~ cookies[:fav]
        fav_ary = cookies[:fav].split('&')
      else
        fav_ary << cookies[:fav]
      end
    end
    result[:star] = fav_ary.find{ |elem| elem == params[:img_id]} ? true : false
    if result[:star]
      fav_ary.delete(params[:img_id])
    else
      fav_ary.push(params[:img_id])
    end
    cookies[:fav] = fav_ary.uniq
    result[:fav] = fav_ary.uniq
    render :json => result
  end

  def unset_fav
    cookies[:favorite] = {:value => false}
  end
end
