class CreateYoutubeV3Auths < ActiveRecord::Migration
  def change
    create_table :youtube_v3_auths do |t|
      t.string :access_token
      t.string :token_type
      t.string :expires_in
      t.string :refresh_token

      t.timestamps
    end
  end
end
