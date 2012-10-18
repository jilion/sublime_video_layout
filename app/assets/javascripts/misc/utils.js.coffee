SublimeVideo.Misc.Utils =
  topDomainHost: ->
    document.location.host.split('.').slice(-2).join('.')

  docsUrl: (path, stage = 'stable') ->
    stage = if stage is 'stable' then '' else "/#{stage}"

    "http://docs.#{SublimeVideo.Misc.Utils.topDomainHost()}#{stage}/#{path}"

  iOS: ->
    /i(p[oa]d|phone)/i.test(navigator.userAgent)

  capitalize: (str) ->
    str.replace(/^\w/, ($0) -> $0.toUpperCase())
