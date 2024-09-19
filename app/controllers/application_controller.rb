class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        user_dashboard_path
    end

    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path # or any path you prefer, e.g., root_path or dashboard_path
    end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        end
end
