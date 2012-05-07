jQuery ->

  $('body').on 'submit', 'form.ajax', ->
    f = $(this)
    $.ajax
      dataType: "script",
      type: f.attr('method') || "POST",
      url: f.attr("action"),
      data: f.serialize()
    false

