# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.new(permitted_params)
    return if @user.save

    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.permit(:email, :password_digest)
  end
end
