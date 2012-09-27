Rails.application.routes.draw do

  root to: 'application#page', page: 'home'
  get 'error_404', to: 'errors#error_404'
  get 'error_500', to: 'errors#error_500'
  get ':page' => 'application#page'

end
