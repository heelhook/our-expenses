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

  $('a[href="#textarea-modal"]').on 'click', (e) ->
    $('#textarea-modal').modal('show')
    false

  $('#textarea-modal a.btn.btn-primary').on 'click', (e) ->
    $('#textarea-modal a.btn').fadeOut()
    $.ajax
      url: '/tickets/process_text'
      method: 'post'
      dataType: 'json'
      data:
        text: $('#textarea-modal textarea').val()
      success: (data) ->
        for entry in data
          $('a.add_fields').click()
          $('input[name$="[description]"]:last').val(entry[0])
          $('input[name$="[amount_cents]"]:last').val(entry[1])
        $('#textarea-modal').modal('hide')

  $(document).delegate '#textarea-modal textarea', 'keydown', (e) ->
    keyCode = e.keyCode or e.which
    if keyCode == 9
      e.preventDefault()
      start = this.selectionStart
      end = this.selectionEnd
      # set textarea value to: text before caret + tab + text after caret
      $(this).val $(this).val().substring(0, start) + '\t' + $(this).val().substring(end)
      # put caret at right position again
      $(this).get(0).selectionStart = $(this).get(0).selectionEnd = start + 1
