class HomeController < ApplicationController
  def index
    location_id = 284860
    @medias = Instagram.tag_recent_media(URI.encode("笑顔")) &&
              Instagram.location_recent_media(location_id) ||
              Instagram.tag_recent_media(URI.encode("元気")) &&
              Instagram.location_recent_media(location_id)
  end
end
