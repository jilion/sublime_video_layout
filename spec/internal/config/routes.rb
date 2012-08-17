Rails.application.routes.draw do

  root to: 'application#page', page: 'home'
  get '404', to: 'errors#error_404'
  get '500', to: 'errors#error_500'
  get ':page' => 'application#page'

end
