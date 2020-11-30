class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!, :unless => :devise_controller?
  check_authorization
  PUBLIC_ACTIONS = [:index, :show]

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      render json: { message: "You don't have permissions." }, status: :forbidden
    else
      render json: { message: "You need to be logged in." }, status: :unauthorized
    end
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: :bad_request
  end
end
