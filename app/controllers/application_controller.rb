class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token 
  protect_from_forgery prepend: true
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :cor
    
    rescue_from ActionController::InvalidAuthenticityToken, :with => :bad_token

    def bad_token
      Rails.logger.debug("session expired!")
      # flash[:warning] = "Session expired"
    end

    def cor
      headers["Access-Control-Allow-Origin"]  = "*"
      headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
      headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
      head(:ok) if request.request_method == "OPTIONS"
    end
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:city,:country,:role])
    end
end
