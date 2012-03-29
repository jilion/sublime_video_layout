class SublimeVideo.UI.Utils
  @makeSticky: (element, cssSelector) ->
    $("#{cssSelector} .active").each -> jQuery(this).removeClass 'active'

    element.addClass 'active'
    if li = element.parent 'li' then li.addClass 'active'

  # Opens a new popup and store its reference in `SublimeVideo.UI.popup`
  #
  # @param [Object] options the options accepted by {SublimeVideo.UI.Popup}
  # @see SublimeVideo.UI.Popup
  #
  @openPopup: (options) ->
    SublimeVideo.UI.popup = new SublimeVideo.UI.Popup(options)
    SublimeVideo.UI.popup.open()

  # Closes the currently opened `SublimeVideo.UI.popup`
  #
  @closePopup: ->
    SublimeVideo.UI.popup = new SublimeVideo.UI.Popup() unless SublimeVideo.UI.popup?
    SublimeVideo.UI.popup.close()

    false
