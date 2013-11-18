# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



ready = ->
  $('#message_recipient').autocomplete
    source: '/user_suggestions.json'
    select: (ev, data)->
      $('#message_recipient_id').val(data.item.id)

$(document).ready ready
$(document).on 'page:load', ready
