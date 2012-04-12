$ ->
  FeedbackForm =
    $el: $("#feedback_popup")

    open: ->
      if ! @isOpen()
        @$el.addClass("open")
        @$el.find('textarea').focus()

    close: ->
      if @isOpen()
        @$el.removeClass("open")

    isOpen: ->
      @$el.hasClass("open")

    toggle: ->
      if @isOpen()
        @close()
      else
        @open()

    updateWithResponse: (response) ->
      if response.success
        @replaceFormWithMessage(response.success)
        @waitThen =>
          @close()
          @reset()
          @clear()
      else
        @replaceFormWithMessage(response.error)
        @waitThen =>
          @reset()

    replaceFormWithMessage: (message) ->
      @$el.find('form').hide()
      @$el.find('.message').text(message).show()
      @$el.find('.title').hide()

    waitThen: (callback) ->
      setTimeout(callback, 2000)

    reset: ->
      @$el.find('.message').hide()
      @$el.find('.title').show()
      @$el.find('form').show()

    clear: ->
      @$el.find('form')[0].reset()

    showSending: ->
      @replaceFormWithMessage "Sending..."

    hideSending: ->


  $('#feedback_popup .title').click ->
    FeedbackForm.toggle()
    false

  $('#feedback_popup form').bind 'ajax:beforeSend', ->
    FeedbackForm.showSending()
  $('#feedback_popup form').bind 'ajax:complete', ->
    FeedbackForm.hideSending()

  $('#feedback_popup form').bind 'ajax:error', ->
    FeedbackForm.updateWithResponse
      error: "Internal error. Try again later."

  window.FeedbackForm = FeedbackForm
