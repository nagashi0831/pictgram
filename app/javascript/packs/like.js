$(function(){ // if document is ready
  alert('jQuery is ready.');
});

//いいねをしたら赤になる
$('.topic-index-icon-like').on('click', function() {
  $(this).css('filter', 'invert(15%) sepia(95%) saturate(6932%) hue-rotate(358deg) brightness(95%) contrast(112%)');
});