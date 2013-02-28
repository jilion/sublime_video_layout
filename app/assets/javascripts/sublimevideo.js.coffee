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

$.fn.exists = -> @length > 0

SublimeVideo.UI.prepareRemoteLinks = ->
  $('a.remote').each ->
    new SublimeVideo.UI.RemoteLink($(this))

SublimeVideo.UI.prepareStickyMenus = ->
  $('ul.sticky').each ->
    new SublimeVideo.UI.Menu($(this)).setupStickyItems()

SublimeVideo.UI.updateActiveItemMenus = ->
  $('ul.sticky').each ->
    new SublimeVideo.UI.Menu($(this)).updateActiveItem()

SublimeVideo.UI.prepareSignupAndLoginPopup = ->
  $.each ['signup', 'login'], (index, action) ->
    $("##{action}_button").on 'click', (event) ->
      event.preventDefault()
      SublimeVideo.UI.Utils.openAccountPopup(action)

SublimeVideo.documentReady = ->
  SublimeVideo.Misc.BrowserBugsFixer.fixAllBugs()

  # Only one popup can be opened-up at a time
  SublimeVideo.UI.popup = null

  if matches = document.location.search.match(/p=(login|signup)/)
    SublimeVideo.UI.Utils.openAccountPopup(matches[1])

  SublimeVideo.UI.prepareSignupAndLoginPopup()

  $('input.show_password[type=password]').each (index, input) ->
    new SublimeVideo.Form.ShowPassword($(this), index)

  unless Modernizr.input.placeholder
    $('input[placeholder]').each ->
      new SublimeVideo.Form.PseudoPlaceholder($(this))
    $('textarea[placeholder]').each ->
      new SublimeVideo.Form.PseudoPlaceholder($(this))

  $('form').each ->
    new SublimeVideo.Form.SubmitManager($(this))

  SublimeVideo.UI.prepareStickyMenus()

  SublimeVideo.UI.prepareRemoteLinks()

  new SublimeVideo.UI.Menu($('#header_menu')).setupLoggedInBehavior()

$(document).ready ->
  SublimeVideo.documentReady()
