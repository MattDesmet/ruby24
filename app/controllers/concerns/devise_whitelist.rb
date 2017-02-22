module DeviseWhitelist
  #name above must be exactly the same as this file name.
  extend ActiveSupport::Concern
  included do
    # code to allow for :name param in devise NEW create/new routes
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
