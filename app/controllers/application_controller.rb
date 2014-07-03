class ApplicationController < ActionController::API
  def default_serializer_options
    { root: false }
  end

  private

  # This is used to allow the cross origin requests
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = %w(GET POST OPTIONS).join(',')
  end
end
