# The RemoteLink add a sticky behavior, shows a table spinner and push new state.
#
class SublimeVideo.UI.RemoteLink
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
      history.pushState({ isHistory: true }, document.title, @element.attr('href')) if history and history.pushState?

  # @private
  #
  stickyBehavior: ->
    @element.parent().find('a.active').each -> jQuery(this).removeClass 'active'
    @element.addClass 'active'
