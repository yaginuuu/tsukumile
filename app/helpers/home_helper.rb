module HomeHelper
  def judge_fav_instagram(img_url)
    img_id = img_url.delete("https://instagram.com/p/")
    fav_instagram_ary = []
    if cookies[:instagram_fav].present?
      if /&/ =~ cookies[:instagram_fav]
        fav_instagram_ary = cookies[:instagram_fav].split('&')
      else
        fav_instagram_ary << cookies[:instagram_fav]
      end
    end
    fav_instagram_ary.find{ |elem| elem == img_id} ? true : false
  end

  def judge_fav_twitter(id)
    fav_twitter_ary = []
    if cookies[:twitter_fav].present?
      if /&/ =~ cookies[:twitter_fav]
        fav_twitter_ary = cookies[:twitter_fav].split('&')
      else
        fav_twitter_ary << cookies[:twitter_fav]
      end
    end
    fav_twitter_ary.find{ |elem| elem.to_i == id.to_i} ? true : false
  end
end
