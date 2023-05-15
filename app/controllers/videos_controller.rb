# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    @videos = current_user.videos
  end

  def create
    response = ::Videos::Sharer.new(permitted_params, current_user).call
    payload = response[:payload]
    if response[:success]
      return render json: { messages: 'Video shared successful', payload: payload },
                    status: :created
    end

    render json: { errors: payload }, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.permit(:url)
  end
end
