# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :validate_user, only: :create
  skip_before_action :authenticate_user, only: :create

  def create
    @access_token = generate_access_token
  end

  private

  def permitted_params
    params.permit(:email, :password)
  end

  def generate_access_token
    JsonWebToken.encode(user_email: @user.email)
  end

  def validate_user
    @user = User.find_by(email: permitted_params[:email])

    return render json: { errors: 'user not exist' }, status: :unprocessable_entity if @user.blank?

    return if @user.authenticate(permitted_params[:password]).present?

    render json: { errors: 'invalid password' },
           status: :unprocessable_entity
  end
end
