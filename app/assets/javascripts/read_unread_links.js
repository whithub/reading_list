$(document).ready(function () {
  $("a.read").click(function(event) {
    event.preventDefault();

    var link = $(this);
    $.getJSON( link.attr('href'), function( data ) {
      link.parent().find('h4.status').html('Status: ' + data.status);
    });
  });

  $("a.unread").click(function(e) {
    e.preventDefault();

    var link = $(this);
    $.getJSON( link.attr('href'), function (data) {        //attr('href') is extracting/finding the href link from the a tag...
      link.parent().find('h4.status').html('Status: ' + data.quality);
    })
  });
});
