var setFavorite = function(){
  $('div .fav').click(function(){
    $.ajax({
      type: "GET",
      url: 'home/favorite',
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

