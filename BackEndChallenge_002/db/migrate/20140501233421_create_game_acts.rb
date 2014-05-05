class CreateGameActs < ActiveRecord::Migration
  def change
    create_table :game_acts do |t|
      t.string :name
      t.timestamps
    end
  end
end
