# The Flash create a new flash notice element and prepend it to the `#content` element.
#
SublimeVideo.UI.Table =
  # Shows a spinner
  #
  showSpinner: ->
    if ($tableSpinner = $('#table_spinner')).exists()
      $tableSpinner.show()
