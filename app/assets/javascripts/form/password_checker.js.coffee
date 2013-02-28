# This class provides a "current password checker" popup.
#
class SublimeVideo.Form.PasswordChecker
  # Creates a new "current password checker" popup using {SublimeVideo.UI.Utils.openPopup}.
  #
  constructor: (@originForm) ->
    passwordState = if @originForm.data('password-state') then " #{@originForm.data('password-state')}" else ''
    passwordCheckerForm = $('<form>', id: 'password_checker_form', action: '/password/validate', method: 'post', 'data-remote': 'true')
    passwordCheckerForm.html("<p class='desc'>Your#{passwordState} password is needed to perform this action:</p>" +
    "<div class='entry password'>" +
    "<label for='password_check' class='icon'>#{passwordState} Password</label>" +
    "<input type='password' id='password_check' name='password' placeholder='Your#{passwordState} password' class='text' />" +
    "<div class='actions'><input type='submit' class='blue_button' value='Done' /></div>" +
    "<div class='spacer'></div>" +
    "</div>")

    SublimeVideo.UI.Utils.openPopup(id: 'password_checker', class: 'popup', form: @originForm, content: passwordCheckerForm)
    $('#password_check').focus()
