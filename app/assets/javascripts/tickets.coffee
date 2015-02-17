# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('a[data-role="assign-me"]').on 'click', (e) ->
    input = $($(e.target).data().target)
    input.val(100).trigger('change')
    id = input.parents('.cell[data-id]').data().id
    myid = input.attr('id')
    $("input.dial[id^='#{id}_'][id!='#{myid}']").val(0).trigger('change')

  $('.dial').knob(
    change: (val) ->
      obj = this.$
      id = obj.parents('.cell[data-id]').data().id
      myid = obj.attr('id')
      $("input.dial[id^='#{id}_'][id!='#{myid}']").val(100-val).trigger('change')
  )

  $('a[data-role="split"]').on 'click', (e) ->
    id = $(e.target).parents('.cell[data-id]').data().id
    $("input.dial[id^='#{id}_']").val(50).trigger('change')
