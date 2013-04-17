# Manages pseudo-placeholders essentially for:
#
# - IE < 10
# - Firefox < 4
# - Safari < 4
# - iOS/Safari < 4
# - Opera Mini
# - Android
#
# More info on compatibility here: http://caniuse.com/#search=placeholder
#
# What it does is setting the value of the field from its placeholder attribute
# and adding a class to reproduce the placeholder style.
#
class SublimeVideo.Form.PseudoPlaceholder

  # Construct a pseudo placeholder.
  #
  # @todo Clarify how this shit works
  # @param [jQuery Element] field an input or a textarea DOM element
  #
  constructor: (@field) ->
    this.fieldDidChange(@field)

  # This is a public API method that updates `@field`, resets its value if needed
  # before setuping the pseudo placeholder.
  #
  # @param [jQuery Element] field the new input field to which is applied the pseudo placeholder
  #
  fieldDidChange: (field) ->
    @field = field
    # Firefox set the value with the placeholder when reloading the page, so clear this shit!
    if @field.val() is @field.attr('placeholder')
      @field.val('')
    this.setupPseudoPlaceholder()

  #
  # @private
  #
  # @param [String] value the new value for the 'value' attribute
  #
  setValueAndToggleClass: (value) ->
    @field.val(value)
    if value is ''
      @field.removeClass('placeholder')
    else
      @field.addClass('placeholder')

  # Copy 'placeholder' attribute to 'value' attribute if it's empty.
  #
  # @note If it's a password field this will also take care to initially
  #   replace it with a regular text field (until it receives focus).
  #
  # @private
  #
  setupPseudoPlaceholder: =>
    this.storeSelfReferenceAndObservers()

    if @field.val() is ''
      if @field.data('showPasswordObject') and @field.attr('type') is 'password'
        @field.data('showPasswordObject').toggleField(type: 'text')
      else
        this.setValueAndToggleClass(@field.attr('placeholder'))

  # This stores a reference to this object into `@field` and register observers on focus & blur.
  #
  # @private
  #
  storeSelfReferenceAndObservers: ->
    @field.data('pseudoPlaceholderObject', this)
    @field.on('focus', this.clearPseudoPlaceholder)
    @field.on('blur',  this.setupPseudoPlaceholder)

  # This method clear the value and class of the field if its value is equal to the placeholder.
  #
  # @note It automatically replaces the field with a password field if needed.
  #
  # @private
  #
  clearPseudoPlaceholder: =>
    if @field.val() is @field.attr('placeholder')
      this.setValueAndToggleClass('')

      if @field.data('showPasswordObject')
        showPasswordObject = @field.data('showPasswordObject')
        @field.removeData() # ensure the #fieldDidChange callback won't be called
        @field = showPasswordObject.toggleField()
        this.storeSelfReferenceAndObservers() # since we have a new field

        # refocus (the newly create field)
        setTimeout((=> @field.focus()), 0) # msie hack
