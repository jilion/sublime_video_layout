Rails.application.routes.draw do

  if Rails.env == 'test' || !Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end

end
