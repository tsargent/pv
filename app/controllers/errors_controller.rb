class ErrorsController < ApplicationController

  def show
    status_code = params[:code] || 500
    render status_code.to_s, status: status_code, layout: 'application', template: "errors/#{status_code.to_s}"
  end

end