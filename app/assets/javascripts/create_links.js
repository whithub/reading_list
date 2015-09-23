$(document).ready(function () {

  $('form.new_link').submit(function(e) {
    //e.preventDefault();
    $(this).find('.form-field').each(function(n, element) {
      if ($(element).val() == '') {

        alert('You need a valid URL.');
        $(element).parent().addClass("error");

        return false;
      }
    });

    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: valuesToSubmit,
      dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
      console.log("success", json);
      new_link = '<div class="read-links">';
      new_link = new_link + '<h1>' + json.title + '</h1>';
      //new_link = new_link + '<dl><h3 class="quality">Quality:' + json.quality + '</h3>';
      //new_link = new_link + '<h3 class="description">' + json.description + '</h3>';

      new_link = new_link + '</dl></div>';
      $('.links').prepend(new_link);
    });
  });

});


