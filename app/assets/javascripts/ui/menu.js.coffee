# The Flash create a new flash notice element and prepend it to the `#content` element.
#
class SublimeVideo.UI.Menu
  #
  # @param [jQuery Element] element the menu (ul) element
  #
  constructor: (@element) ->

  setupStickyItems: ->
    @element.find('a').each (index, el) =>
      el.on('click', this.stickyBehavior) unless el.hasClass 'no_sticky'

  stickyBehavior: (event) =>
    @element.find('.active').each -> jQuery(this).removeClass 'active'
    link = jQuery(event.target)
    link.addClass 'active'
    li.addClass 'active' if li = link.parent('li')