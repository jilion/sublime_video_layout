# The Flash create a new flash notice element and prepend it to the `#content` element.
#
class SublimeVideo.UI.menu
  #
  # @param [jQuery Element] element the menu (ul) element
  #
  constructor: (@element) ->

  setupStickyItems: ->
    @element.find('a').each (index, el) =>
      el = jQuery(el)
      el.on('click', this.stickyBehavior) unless el.hasClass 'no_sticky'

  updateActiveItem: ->
    @element.find('.active').removeClass('active')
    @element.find('li').each (index, el) =>
      li = $(el)
      a = li.find('a').first()
      if a.attr('href') == location.href
        li.addClass 'active'

  # @private
  #
  stickyBehavior: (event) =>
    @element.find('.active').removeClass 'active'
    link = jQuery(event.delegateTarget)
    if li = link.parent('li')
      li.addClass 'active'
    else
      link.addClass 'active'

  setupLoggedInBehavior: ->
    @cookie = new SublimeVideo.Misc.Cookie('l')
    if @cookie.get() == '1'
      @element.find('.unlogged').hide()
      @element.find('.logged').show()
