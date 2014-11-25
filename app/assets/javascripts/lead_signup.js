(function($, window, document) {
  // The $ is now locally scoped
  // The rest of your code goes here!
  $(document).ready(function() {
    $(".js-lead-sigup-form").on("submit", function(event) {
      var form = event.currentTarget;
      event.preventDefault();

      $.ajax({
        url: form.action,
        dataType: "json",
        type: 'POST',
        beforeSend: function(xhr) {
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
        },
        data: $(form).serialize(),
        success: function(data) {
          var thankyouMessage = "<div class='thank-you-note alert alert-success'>Thank you for subscribing</div>";
          $(".js-lead-sigup-form-wrapper").html(thankyouMessage);
        },
        error: function(xhr) {
          var errors = $.parseJSON(xhr.responseText).errors
          var errorsWrapper = $("<ul class='js-form-errors alert alert-danger'></ul>");
          $(".js-lead-sigup-form-errors").html(errorsWrapper);
          $.each(errors, function(key, value) {
            var attr = key.toLowerCase().replace(/\b[a-z]/g, function(letter) {
              return letter.toUpperCase();
            });

            $(".js-lead-sigup-form-errors .js-form-errors").append("<li class='error'>" + attr + " " + value + "</li>");
          });
        }
      })
    });
  });
}(window.jQuery, window, document));
