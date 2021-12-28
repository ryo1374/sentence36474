$(function() {
  $('#js-copybtn').on('click', function(){
    let text = $('#js-copytext').text();
    let $textarea = $('<textarea></textarea>');
    $textarea.text(text);
    $(this).append($textarea);
    $textarea.select();
    document.execCommand('copy');
   $textarea.remove();
    $('#js-copyalert').show().delay(2000).fadeOut(400);
  });
});