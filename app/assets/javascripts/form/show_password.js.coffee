# Manages the showing/hiding in clear text of the entered password
#
class SublimeVideo.Form.ShowPassword
  constructor: (@field, @index) ->
    # @field                 = jQuery(passwordField)
    @showPasswordCheckbox  = jQuery('<input />', type: 'checkbox', id: 'show_password_#{@index}')

    this.storeThisInData()
    this.insertShowPasswordCheckbox()

  #
  # @private
  #
  storeThisInData: ->
    @field.data 'showPasswordObject', this # so that the placeholderManager can eventually pick this up

  #
  # @private
  #
  insertShowPasswordCheckbox: ->
    showPasswordWrap  = jQuery('<div>', class: 'checkbox_wrap')
    showPasswordLabel = jQuery('<label />', for: 'show_password_#{@index}').text 'Show password'
    showPasswordWrap.append(@showPasswordCheckbox).append(showPasswordLabel)

    this.injectShowPasswordCheckboxInDom(showPasswordWrap)
    this.attachEventHandlerToCheckbox()

  #
  # @private
  #
  attachEventHandlerToCheckbox: ->
    @showPasswordCheckbox.on 'click', this.togglePasswordVisibility

  #
  # @private
  #
  injectShowPasswordCheckboxInDom: (showPasswordWrap) ->
    errorMessage = @field.parent('form').find('.inline_errors').first()
    if errorMessage.length
      errorMessage.after showPasswordWrap
    else
      @field.after showPasswordWrap
    @showPasswordCheckbox.checked = false # Firefox reload ;-)

  #
  # @private
  #
  showPassword: ->
    @showPasswordCheckbox and @showPasswordCheckbox.attr 'checked'

  #
  # @private
  #
  togglePasswordVisibility: (event) =>
    this.toggleField()

  #
  # @private
  #
  # @param [Object] options allow customizing the generated field
  # @option options [Boolean] type force the type of the generated field
  #
  toggleField: (options = {}) ->
    fieldType = if options['type']?
      options['type']
    else if this.showPassword() then 'text' else 'password'

    # We can't simply modify the type attribute of the field (from 'password' to 'text'), because IE doesn't support this
    # cf: http://www.alistapart.com/articles/the-problem-with-passwords
    newField = jQuery '<input />'
      id:          @field.attr 'id'
      name:        @field.attr 'name'
      value:       @field.attr 'value'
      size:        @field.size()
      placeholder: @field.attr 'placeholder'
      required:    @field.attr 'required'
      class:       @field.attr 'class'
      type:        fieldType

    pseudoPlaceholderObject = @field.data('pseudoPlaceholderObject') if @field.data 'pseudoPlaceholderObject'

    @field.removeData() # Removes eventual observers and storage keys
    @field.replaceWith newField
    @field = newField
    this.storeThisInData() # store this in the new field
    pseudoPlaceholderObject.fieldDidChange(newField) if pseudoPlaceholderObject

    if @field.attr('id') is 'user_password' and jQuery('current_password_wrap').length
      SublimeVideo.currentPasswordHandler.setupField @field

    @field
