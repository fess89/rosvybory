$ ->
  bindDialogOnClick $("#index_table_users .edit_link"), "Редактирование пользователя"
#  bindDialogOnClick $("#index_table_users .view_link"), "Просмотр пользователя"
  bindDialogOnClick $("#index_table_dislocations .edit_link"), "Редактирование расстановки"
  bindDialogOnClick $("#index_table_dislocations .view_errors_link"), "Просмотр ошибок расстановки"

  $('.collection_selection').click () ->
    $('#all-pages-container').remove()

  $('#collection_selection_toggle_all').click () ->
    if (this.checked)
      apc = $('<div>', {id: 'all-pages-container', style: 'display: inline-block; margin-right: 2em'})
      $('<input>', {name: 'filters', type: 'hidden', value: $('#new_q').serialize()}).appendTo(apc)
      $('<input>', {name: 'all_pages', type: 'checkbox', id: 'all-pages', value: 1}).appendTo(apc)
      $('<label>', {'for': 'all-pages'}).text(' Применить ко всем страницам').appendTo(apc)
      $('#batch_actions_selector').after(apc)
    else
      $('#all-pages-container').remove()