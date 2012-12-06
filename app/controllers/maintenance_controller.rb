class MaintenanceController < ActionController::Base

  # GET /private/:code
  def skip
    cookies[:maintenance] = {
      value: params[:code],
      expires: 1.week.from_now,
      domain: :all
    }
    redirect_to root_path
  end

end
