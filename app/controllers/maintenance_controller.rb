class MaintenanceController < ActionController::Base

  # GET /maintenance
  def show
    if request.env["MAINTENANCE"]
      render file: 'layouts/maintenance', layout: false
    else
      redirect_to root_path
    end
  end

end
