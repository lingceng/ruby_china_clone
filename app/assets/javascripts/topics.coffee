# topics
window.Topics =
  init: ->
    $('#preview_btn').click ->
      Topics.preview($('#topic_content').val())


  preview: (body) ->
    cnt = $("#preview_cnt")

    $.post "/topics/preview", "body": body, 
      (data) ->
        cnt.html(data.body)
      'json'

$(document).ready ->
  if $('body').data('controller-name') in ['topics']
    Topics.init()
