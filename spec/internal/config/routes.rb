Rails.application.routes.draw do

  root to: 'application#page', page: 'home'
  get ':page' => 'application#page'

end
