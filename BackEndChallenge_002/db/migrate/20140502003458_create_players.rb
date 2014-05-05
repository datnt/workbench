class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      # This is a DOA game, so that each player can play only 1 game
      t.belongs_to :game
      t.string :name
      t.string :moves
      t.timestamps
    end
  end
end
