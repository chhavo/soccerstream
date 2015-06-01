class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :live_game
      t.string :upcoming_game
      t.string :team_news
      t.string :live_commentary

      t.timestamps

    end
  end
end
