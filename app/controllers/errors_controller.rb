class ErrorsController < ApplicationController
  layout 'error'

  def error_404
    render_404
  end

  def error_500
    render_500
  end
end
