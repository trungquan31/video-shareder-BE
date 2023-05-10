# frozen_string_literal: true

class ApplicationController < ActionController::API
  wrap_parameters false
  before_action :authenticate_user

  private

  def current_user
    @current_user ||= User.find_by(email: authenticate_user[:user_email])
  end

  def authenticate_user
    JsonWebToken.decode(auth_header)
  end

  def auth_header
    return headers['Authorization'].split.last if headers['Authorization'].present?

    render json: { errors: 'Missing token' }
  end
end
