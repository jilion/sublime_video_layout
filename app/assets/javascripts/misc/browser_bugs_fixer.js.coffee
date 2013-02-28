class SublimeVideo.Misc.BrowserBugsFixer
  @fixAllBugs: ->
    # ## Fix a <select> CSS bug in Safari (under v4.0.5)
    # Safari 5.0 has webkit version 533
    # Safari 4.0.5 is the last version pre-5.0
    # NOTE: Safari 4.0.4 and 4.0.5 have the same webkit version number (531)
    webkitVersionNumber   = navigator.userAgent.match(/AppleWebKit\/([0-9]+)./)
    isSafari405OrPrevious = navigator.userAgent.indexOf("Macintosh") > -1 and webkitVersionNumber and parseInt(webkitVersionNumber[1],10) <= 531;

    if isSafari405OrPrevious
      $('select').each ->
        $(this).css('font-family': 'Lucida Grande, Arial, sans-serif', 'font-size': '15px')
