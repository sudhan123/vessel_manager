module Api
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    include ErrorResponseGenerator
    before_action :set_default_request_format, :is_authorized?
    private
    # Handle all requests as json format
    def set_default_request_format
      request.format = :json
    end

    #handle authorization
    def is_authorized?
      if !request.headers['x-api-key'].present? || request.headers['x-api-key'] != ENV['X_API_KEY']
        return render json: { error: 'Not authorized' }, status: :unauthorized
      end
    end
  end
end
