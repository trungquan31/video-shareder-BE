# frozen_string_literal: true

module Videos
  class Sharer
    def initialize(params, user)
      @url = params[:url]
      @video = Video.find_or_create_by(url: @url )
      @user = user
    end

    def call
      return errors_message('video adready shared')  if UserVideo.exists?(video_id: @video.id, user_id: @user.id)

      user_videos = UserVideo.new(video_id: @video.id, user_id: @user.id)
      return errors_message(user_videos.errors) unless user_videos.save

      success_message(@video.url)
    end

    private

    def success_message(payload)
      { success: true, payload: payload }
    end

    def errors_message(payload)
      { success: false, payload: payload }
    end
  end
end
