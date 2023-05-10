# frozen_string_literal: true

module Videos
  class Sharer
    def initialize(params, user)
      @url = params[:url]
      @user = user
    end

    def call
      @user.videos.find_or_create_by(url: @url)
      @user.save
      @user
    end
  end
end
