class SublimeVideo.Media.ImagePreloader
  constructor: (imageUrl, callback, options = {}) ->
    @callback = callback
    @imageSrc = imageUrl
    @options  = options
    @problem  = false
    this.preload()

  preload: ->
    @image = new Image()

    @image['onload']  = this.didComplete
    @image['onerror'] = this.didFail
    @image['onabort'] = this.didAbort
    @image['src']     = @imageSrc

  didFail: =>
    @problem = true
    this.didComplete()

  didAbort: =>
    @problem = true
    this.didComplete()

  didComplete: =>
    @options['width']  = @image['width']
    @options['height'] = @image['height']
    @callback(@problem, @imageSrc, @options)

class SublimeVideo.Media.VideoPreloader
  constructor: (videoUrl, callback) ->
     @callback = callback
     @videoSrc = videoUrl
     this.preload()

  preload: ->
    SublimeVideoSizeChecker.getVideoSize @videoSrc, @callback
