class CreateUsersVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_videos, id: false do |t|
      t.references :user
      t.references :video
    end
  end
end
