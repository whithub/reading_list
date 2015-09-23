
$(document).ready(function () {
  $("a#read-link").click(function(event) {
    console.log("PLEASE WORK!!!")
    event.preventDefault();

    var link = $(this);
    $.getJSON( link.attr('href'), function( data ) {
      console.log(data);
      link.parent().find('h4.status').html('Status: ' + data.status);
    });
  });

  $("a#unread-link").click(function(e) {
    e.preventDefault();

    var link = $(this);
    $.getJSON( link.attr('href'), function (data) {
      link.parent().find('h4.status').html('Status: ' + data.status);
    })
  });
});
