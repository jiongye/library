jQuery ->

  $('body').on 'submit', 'form.ajax', ->
    f = $(this)
    $.ajax
      dataType: "script",
      type: f.attr('method') || "POST",
      url: f.attr("action"),
      data: f.serialize()
    false

  $('body').on 'click', 'a.ajax', ->
    url = $(this).attr('href')
    $.getScript(url)
    $('table tbody tr.highlight').removeClass("highlight")
    $(this).closest('tr').addClass("highlight")
    false
