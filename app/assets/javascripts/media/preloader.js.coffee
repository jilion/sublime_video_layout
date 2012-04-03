class SublimeVideo.Media.Preloader
  constructor: (@src, @callback, @options = {}) ->
    @problem = false
    this.preload()

class SublimeVideo.Media.ImagePreloader extends SublimeVideo.Media.Preloader
  preload: ->
    @image = new Image()

    @image['onload']  = this.didComplete
    @image['onerror'] = this.didFail
    @image['onabort'] = this.didAbort
    @image['src']     = @src

  didFail: =>
    @problem = true
    this.didComplete()

  didAbort: =>
    @problem = true
    this.didComplete()

  didComplete: =>
    @options['width']  = @image['width']
    @options['height'] = @image['height']
    @callback(@problem, @src, @options)

class SublimeVideo.Media.VideoPreloader extends SublimeVideo.Media.Preloader
  preload: ->
    SublimeVideoSizeChecker.getVideoSize(@src, @callback)
