# The Flash create a new flash notice element and prepend it to the `#content` element.
#
class SublimeVideo.UI.SortLink
  #
  # @param [DOM Element] element the element to which attach the behavior
  #
  constructor: (element) ->
    @element = jQuery(element)

  setupRemote: ->
    this.makeRemoteLinkSticky()
    SublimeVideo.UI.Table.showSpinner()

  makeRemoteLinkSticky: ->
    container = 
    @element.parent().find('a.active[data-remote]').each -> jQuery(this).removeClass
    @element.addClass 'active'
