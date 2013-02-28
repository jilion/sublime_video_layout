# The Flash create a new flash notice element and prepend it to the `#content` element.
#
class SublimeVideo.UI.Menu
  #
  # @param [jQuery Element] element the menu (ul) element
  #
  constructor: (@element) ->

  setupStickyItems: ->
    @element.find('a').each (index, el) =>
      $el = $(el)
      unless $el.hasClass('no_sticky')
        $el.on('click', this.stickyBehavior)

  updateActiveItem: ->
    @element.find('.active').removeClass('active')
    @element.find('li').each (index, el) =>
      $li = $(el)
      if $li.find('a').first().attr('href') is location.href
        $li.addClass 'active'

  # @private
  #
  stickyBehavior: (event) =>
    @element.find('.active').removeClass('active')
    $link = $(event.delegateTarget)
    if $li = $link.parent('li')
      $li.addClass('active')
    else
      $link.addClass('active')

  setupLoggedInBehavior: ->
    @cookie = new SublimeVideo.Misc.Cookie('l')
    if @cookie.get() is '1'
      @element.find('.unlogged').hide()
      @element.find('.logged').show()
