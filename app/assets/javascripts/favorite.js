var setInstagramFavorite = function(){
  $('div .fav').click(function(){
    $.ajax({
      type: "GET",
      url: 'favorite_instagram',
      data: { img_id: $(this).data('img-id') },
      context: $('img', this)
    }).done(function(data) {
      if(data.star == true){
        this.attr('src', "/images/nofav.gif");
      }else{
        this.attr('src', "/images/fav.gif");
      }
    });
  });
};

var setTwitterFavorite = function(){
  $('div .fav').click(function(){
    $.ajax({
      type: "GET",
      url: 'favorite_twitter',
      data: { id: $(this).data('id') },
      context: $('img', this)
    }).done(function(data) {
      if(data.star == true){
        this.attr('src', "/images/nofav.gif");
      }else{
        this.attr('src', "/images/fav.gif");
      }
    });
  });
};

