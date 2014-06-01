# topics
window.Topics =
  init: ->
    content = $('#edit_pane textarea')

    # bind preview function
    $('#preview_btn').click ->
      Topics.preview(content.val())

    # emoji hint
    emojis_list = $.map(window.EMOJI_LIST, (value, i) ->
      { 'id': i, 'name': value }
    )
    content.atwho(
      at: ':',
      tpl: "<li data-value=':${name}:'><img src='/assets/emojis/${name}.png' height='20' width='20'/> ${name} </li>",
      data: emojis_list
    )


  preview: (body) ->
    cnt = $("#preview_cnt")

    $.post "/topics/preview", "body": body,
      (data) ->
        cnt.html(data.body)
      'json'

$(document).ready ->
  if $('body').data('controller-name') in ['topics']
    Topics.init()
