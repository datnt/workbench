class CreateYoutubeAuths < ActiveRecord::Migration
  def change
    create_table :youtube_auths do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :email
      t.string :refresh_token
      t.string :expires_at

  
      t.timestamps
    end
  end
end
