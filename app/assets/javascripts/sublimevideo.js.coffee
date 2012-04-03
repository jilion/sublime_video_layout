# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require modernizr
#= require prototype
#= require prototype_ujs
#= require scriptaculous/s2
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

jQuery(document).ready ->
  # S2.Extensions.webkitCSSTransitions = true;

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
    new SublimeVideo.Form.SubmitManager jQuery(this)

  jQuery('ul.sticky').each ->
    new SublimeVideo.UI.Menu(jQuery(this)).setupStickyItems()

  jQuery('a.sort.sticky').each ->
    new SublimeVideo.UI.SortLink(jQuery(this))

ddd = -> console.log.apply(console, arguments)

# 
# Element.addMethods({
#   shake: function(element, options) {
#     S2.Extensions.webkitCSSTransitions = false; //essential, cause webkit transitions in this case are less smooth
# 
#     element = $(element);
#     var originalLeft = parseFloat(element.getStyle('left') || '0');
#     var oldStyle = { left:originalLeft };
#     element.makePositioned();
# 
#     var opts = { distance:15, duration:0.5 };
#     Object.extend(opts, options);
#     var distance = opts.distance;
#     var duration = opts.duration;
# 
#     var split = parseFloat(duration) / 10.0;
# 
#     var shakeEffect = element.morph('left:' + (originalLeft+distance) + 'px', { duration:split
#       }).morph('left:' + (originalLeft-distance) + 'px', { duration:split*2
#         }).morph('left:' + (originalLeft+distance) + 'px', { duration:split*2
#           }).morph('left:' + (originalLeft-distance) + 'px', { duration:split*2
#             }).morph('left:' + (originalLeft+distance) + 'px', { duration:split*2
#               }).morph('left:' + (originalLeft) + 'px', { duration:split*2, after: function() {
#                 element.undoPositioned().setStyle(oldStyle);
#                 }});
# 
#     return shakeEffect;
#   },
#   pulsate: function(element, options) {
#   }
# });
# 
