# SubmitManager manages several automation on form submit:
#
# - disabling of submit button
# - asking for current password
# - cleaning of pseudo-placeholders
# - cleaning HTML5 errors that are not present anymore but there still are errors (on other fields)
#
class SublimeVideo.Form.SubmitManager
  constructor: (@form) ->
    this.setupOnSubmitObservers()
    this.setupOnClickObservers()

  setupOnSubmitObservers: ->
    submitEvent = if Modernizr.hasEvent('submit') then 'submit' else 'emulated:submit'
    @form.on submitEvent, (event) =>
      this.disableSubmitButton() if @form.attr('data-remote') is 'true'
      this.resetPseudoPlaceholders()
      return this.instanciatePasswordChecker(event) if @form.attr('data-password-protected') is 'true'

  setupOnClickObservers: ->
    @form.find('input[type=submit]').each (index, input) =>
      # when HTML5 form validation doesn't pass, the submit event is not fired
      $(input).on 'click', (event) =>
        @form.find('input,textarea').each (index, input) ->
          $input = $(input)
          if $input[0].validity
            if $input[0].validity.valid
              $input.removeClass 'errors'
              $input.siblings('.inline_errors').remove()
            else
              event.preventDefault()
              $input.addClass 'errors'

  # Disable submit button for ajax forms to prevent double submissions (quickly click muliple times the form submit button)
  #
  # (PAY ATTENTION: this considers that the ajax call will re-render the entire form hence re-enabling the submit button.
  #  If we'll have some ajax forms that won't reload themselves, the code below must be updated)
  disableSubmitButton: ->
    @form.find('input[type=submit]', 'button').each ->
      $(this).attr 'disabled', 'disabled'

  instanciatePasswordChecker: (event) ->
    event.preventDefault()
    SublimeVideo.Form.passwordChecker = new SublimeVideo.Form.PasswordChecker $(event.target)

  # Reset pseudo-placeholders values (for browsers who don't support HTML5 placeholders)
  #
  resetPseudoPlaceholders: ->
    @form.find('input.placeholder').each ->
      $(this).attr 'value', ''
