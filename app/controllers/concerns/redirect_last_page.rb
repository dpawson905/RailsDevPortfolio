module RedirectLastPage
  extend ActiveSupport::Concern

  included do
    before_action :store_user_location!, if: :storable_location?
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end
end