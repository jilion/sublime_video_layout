#= require modernizr
#= require jquery_ujs
#
#= require_self
#= require_tree ./form
#= require_tree ./media
#= require_tree ./misc
#= require_tree ./ui

window.SublimeVideo =
  Form: {}
  Media: {}
  Misc: {}
  UI: {}

SublimeVideo.UI.prepareRemoteLinks = ->
  jQuery('a.remote').each ->
    new SublimeVideo.UI.RemoteLink(jQuery(this))

SublimeVideo.UI.prepareStickyMenus = ->
  jQuery('ul.sticky').each ->
    new SublimeVideo.UI.Menu(jQuery(this)).setupStickyItems()

jQuery(document).ready ->
  SublimeVideo.Misc.BrowserBugsFixer.fixAllBugs()

  # Only one popup can be opened-up at a time
  SublimeVideo.UI.popup = null

  if matches = document.location.search.match(/p=(login|signup)/)
    SublimeVideo.UI.Utils.openAccountPopup(matches[1])

  jQuery('input.show_password[type=password]').each (index, input) ->
    new SublimeVideo.Form.ShowPassword(jQuery(this), index)

  unless Modernizr.input.placeholder
    jQuery('input[placeholder]').each ->
      new SublimeVideo.Form.PseudoPlaceholder(jQuery(this))
    jQuery('textarea[placeholder]').each ->
      new SublimeVideo.Form.PseudoPlaceholder(jQuery(this))

  jQuery('form').each ->
    new SublimeVideo.Form.SubmitManager(jQuery(this))

  SublimeVideo.UI.prepareStickyMenus()

  SublimeVideo.UI.prepareRemoteLinks()

  new SublimeVideo.UI.Menu(jQuery('#header_menu')).setupLoggedInBehavior()

ddd = -> console.log.apply(console, arguments)
