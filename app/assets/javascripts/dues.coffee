# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('a[data-role="select-all"]').on 'click', ->
    checkboxes = $('input[type="checkbox"]')
    checkboxes.prop('checked', !checkboxes.prop('checked'))
