class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :url, null: false, index: { unique: true, name: 'unique_url' }
      t.timestamps
    end
  end
end
