class SublimeVideo.Misc.Cookie
  constructor: (@name) ->

  # It retrieve the value of the cookie with the `@name` key.
  #
  # @return [String] the cookie value or `null` if no cookie with this name exists
  #
  get: ->
    escapedName = this._escapedAndAssignName()
    if document.cookie.indexOf(escapedName) >= 0
      cookies = document.cookie.split(/\s*;\s*/)
      for cookie in cookies
        if cookie.indexOf(escapedName) is 0
          return unescape(cookie.substring(escapedName.length, cookie.length))

    null

  # It stores the given `value` at the `@name` key, given `options`.
  #
  # @param [String] value the value of the cookie to store
  # @param [Object] options cookie options
  # @option options [Date] expires the date when the cookie will expire
  # @option options [String] path the path for which the cookie is available
  # @option options [String] domain the domain for which the cookie is available
  # @option options [Boolean] secure wether the cookie is accessible only through HTTPS
  #
  # @return [String] the cookie value
  #
  set: (value, options = {}) ->
    newcookie = [this._escapedAndAssignName() + escape(value)]
    if options
      if options.expires then newcookie.push "expires=" + options.expires.toGMTString()
      if options.path    then newcookie.push "path=#{options.path}"
      if options.domain  then newcookie.push "domain=#{options.domain}"
      if options.secure  then newcookie.push "secure"
    document.cookie = newcookie.join '; '

  #
  # @private
  #
  _escapedAndAssignName: ->
    escape(@name) + '='
