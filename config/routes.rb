Rails.application.routes.draw do

  get '/private/:code' => 'maintenance#skip'

end
