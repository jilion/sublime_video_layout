class SublimeVideoController < ActionController::Base

  def fake_maintenance_page
    if Rails.env.in?(%w[production staging]) &&
      params[:controller_name] != 'maintenance' && params[:action] != 'skip' &&
      cookies[:maintenance] != ENV['MAINTENANCE_CODE']

      expires_in 1.minute, public: true
      render file: 'layouts/maintenance', layout: false
    end
  end

end
