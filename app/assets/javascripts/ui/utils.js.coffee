SublimeVideo.UI.Utils =
  makeSticky: (element, cssSelector) ->
    $("#{cssSelector} .active").each -> jQuery(this).removeClass 'active'

    element.addClass 'active'
    if li = element.parent 'li' then li.addClass 'active'

  # Opens a new popup and store its reference in `SublimeVideo.UI.popup`
  #
  # @param [Object] options the options accepted by {SublimeVideo.UI.Popup}
  # @see SublimeVideo.UI.Popup
  #
  openPopup: (options) ->
    SublimeVideo.UI.popup = new SublimeVideo.UI.Popup(options)
    SublimeVideo.UI.popup.open()

  # Closes the currently opened `SublimeVideo.UI.popup`
  #
  closePopup: ->
    SublimeVideo.UI.popup = new SublimeVideo.UI.Popup() unless SublimeVideo.UI.popup?
    SublimeVideo.UI.popup.close()

    false

  openAccountPopup: (name, successUrl = null) ->
    if el = jQuery("#popup_#{name}")
      SublimeVideo.UI.popup = new SublimeVideo.UI.SimplePopup(element: el)
      jQuery("#user_return_to").attr(value: successUrl) if successUrl?
      jQuery("#popup_#{name}").find("#user_email").focus() if SublimeVideo.Misc.Utils.iOS()

      SublimeVideo.UI.popup.open()

      _gaq.push(['_trackEvent', 'SignUp', 'Clicked', undefined, 1, true]) if name is 'signup' and _gaq

    false
