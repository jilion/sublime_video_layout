# The SimplePopup simply add observers behaviors on a given `element` object.
#
class SublimeVideo.UI.SimplePopup
  #
  # @param [Object] options a set of options to customize the popup
  # @option options [jQuery Element] element the element that represents the popup
  #
  constructor: (@options = {}) ->
    @element = @options.element

  startObservers: ->
    jQuery(document).on 'keydown', { popup: this }, this.keyDown
    @element.on 'click', { popup: this }, this.click

  stopObservers: ->
    jQuery(document).off 'keydown', this.keyDown
    @element.off('click', this.click) if @element?

  # It closes the popup if it's open, stop the current video playing with SublimeVideo on iOS,
  # shows the popup (simply shows `@element`) and starts the observers that take care of the popup closing.
  #
  open: ->
    this.close()

    sublimevideo.pause() if typeof(sublimevideo) is 'object' and SublimeVideo.Misc.Utils.iOS()

    @element.show()
    this.startObservers()

  # Hides the popup (simply show `@element`) and stops the observers that take care of the popup closing.
  #
  close: ->
    this.stopObservers()
    @element.hide()

  # @private
  #
  keyDown: (event) ->
    switch event.which
      when 27 then event.data.popup.close() # ESC

  # @private
  #
  click: (event) ->
    if event.target is event.data.popup.element[0] then event.data.popup.close()

#
# Handles creation and behavior of SV pop-up (used for showing the embed code and the usage, asking the password..)
#
class SublimeVideo.UI.Popup extends SublimeVideo.UI.SimplePopup
  #
  # @param [Object] options a set of options to customize the popup
  # @option options [String] id the id of the popup (note that this id is also used as a class for
  #   the "content" div inside the popup element)
  # @option options [Integer] numId a unique numerical id to prevent conflicts between several popups
  #   (can be ommited if only one popup can be opened)
  # @option options [String] class the class to apply to the popup
  # @option options [jQuery Element] form the form from which originated the popup opening
  # @option options [jQuery Element] anchor the anchor element in which re-add popup content after closing
  # @option options [jQuery Element] url an url to GET in AJAX (not that the AJAX response must take care
  #   of populating the popup if needed)
  #
  constructor: (@options = {}) ->
    @element = null

  # Create the popup (if needed), append it to the `#content` div (if needed) and show it.
  # It also starts the observers that take care of the popup closing.
  #
  open: ->
    this.close()

    sublimevideo.pause() if typeof(sublimevideo) is 'object' and SublimeVideo.Misc.Utils.iOS()

    unless @element?
      @element = jQuery '<div>'
                   id: "#{@options.id}#{if @options.numId? then "_#{@options.numId}" else ''}"
                   class: "#{@options.class} loading"
      @element.html("<div class='popup_wrap'>
                       <div class='lights'>
                         <div class='content #{@options.id}'></div>
                       </div>
                       <a href='' onclick='return SublimeVideo.UI.Utils.closePopup()' class='close'><span>Close</span></a>
                     </div>")
      jQuery('#content').append @element

    if @options.url?
      # the called method will take care of replacing the wrap div with the response content
      new Ajax.Request @options.url, method: 'get'

    this.startObservers()

  # Stops the observers, move the popup content back to its `anchor` (if applicable)
  # and re-enable `@options.form` buttons.
  #
  close: ->
    this.stopObservers()

    jQuery(@options.anchorId).html @element.find('.content').html() if @options.anchorId? && @element

    jQuery(".#{@options.class}").each -> jQuery(this).remove()

    if @options.form?
      @options.form.find('input[type=submit]', 'button').each -> jQuery(this).removeAttr 'disabled'
