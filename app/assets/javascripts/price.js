$(function(){
  $('#price_calc').on('keyup', function(){
    var data = $('#price_calc').val();
    var profit = Math.round(data * 0.9);
    var fee = (data - profit);
    $('.l-right-f').html(fee);
    $('.l-right-f').prepend('¥');
    $('.l-right-s').html(profit);
    $('.l-right-s').prepend('¥');
    $('#price').val(profit);
    if(profit == '') {
    $('.right_bar_2').html('');
    $('.right_bar').html('');
    }
  })
})