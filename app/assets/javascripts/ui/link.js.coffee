# The Flash create a new flash notice element and prepend it to the `#content` element.
#
class SublimeVideo.UI.SortLink
  #
  # @param [DOM Element] element the element to which attach the behavior
  #
  constructor: (element) ->
    @element = jQuery(element)
    this.setupObserver()

  setupObserver: ->
    @element.on 'click', =>
      this.stickyBehavior()
      SublimeVideo.UI.Table.showSpinner()
      history.pushState({ isHistory: true }, document.title, @element.href) if history && history.pushState

  # @private
  #
  stickyBehavior: ->
    @element.parent().find('a.active').each -> jQuery(this).removeClass 'active'
    @element.addClass 'active'
