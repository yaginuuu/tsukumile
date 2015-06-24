module HomeHelper
  def judge_fav(img_url)
    img_url.delete!("https://instagram.com/p/")
    fav_ary = []
    if cookies[:fav].present?
      if /&/ =~ cookies[:fav]
        fav_ary = cookies[:fav].split('&')
      else
        fav_ary << cookies[:fav]
      end
    end
    fav_ary.find{ |elem| elem == img_url} ? true : false
  end
end
