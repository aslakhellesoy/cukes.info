
  function showBackend(backend) {
    $.each(["ruby", "java", "csharp", "scala", "groovy", "clojure", "javascript", "ioke"], function(i, b) {
      $("." + b).hide();
      var gp = $("." + b).parent().parent();
      if(gp.hasClass('highlight')) {
        gp.hide();
      }
    });

    $("." + backend).show();
    var gp = $("." + backend).parent().parent();
    if(gp.hasClass('highlight')) {
      gp.show();
    }

    $.cookie('backend', backend);
  }

  showBackend($.cookie('backend') || "ruby");
  
  $("#backend img").click(function(e) {
    showBackend(e.target.id);
  });
