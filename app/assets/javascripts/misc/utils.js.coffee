class SublimeVideo.Misc.Utils
  @topDomainHost: ->
    document.location.host.split('.').slice(-2).join('.')

  @iOS: ->
    /i(p[oa]d|phone)/i.test(navigator.userAgent)
