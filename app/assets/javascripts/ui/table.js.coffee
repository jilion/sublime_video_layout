# The Flash create a new flash notice element and prepend it to the `#content` element.
#
SublimeVideo.UI.Table =
  # Shows a spinner
  #
  showSpinner: ->
    tableSpinner.show() if (tableSpinner = jQuery('#table_spinner')).length > 0
