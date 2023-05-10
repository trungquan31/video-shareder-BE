class CreateUsersVideos < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :videos do |t|
      t.index :user_id
      t.index :video_id
    end
  end
end
