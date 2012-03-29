class SublimeVideo.Misc.Utils
  @topDomainHost: ->
    document.location.host.split('.').slice(-2).join('.')
