SublimeVideo.UI.Utils =
  # Opens a new popup and stores its reference in `SublimeVideo.UI.popup`
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
    unless SublimeVideo.UI.popup?
      SublimeVideo.UI.popup = new SublimeVideo.UI.Popup()
    SublimeVideo.UI.popup.close()

    false

  # Opens a new login or signup popup and stores its reference in `SublimeVideo.UI.popup`
  #
  # @param [String] type the type of popup ('login' or 'signup')
  # @param [String] successUrl the URL to which redirect the user once login/signup succeeds (default: null)
  # @see SublimeVideo.UI.Popup
  #
  openAccountPopup: (type, successUrl = null) ->
    if ($el = $("#popup_#{type}")).exists()
      SublimeVideo.UI.popup = new SublimeVideo.UI.SimplePopup(element: $el)

      if successUrl?
        $("#user_return_to").val(successUrl)

      SublimeVideo.UI.popup.open()

      if SublimeVideo.Misc.Utils.iOS()
        $("#popup_#{type}").find("#user_email").focus()

      if _gaq? and type is 'signup'
        _gaq.push(['_trackEvent', 'SignUp', 'Clicked', undefined, 1, true])

    false
