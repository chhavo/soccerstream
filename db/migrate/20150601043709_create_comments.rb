class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :team_name
      t.string :comments
      t.string :user_id

      t.timestamps

    end
  end
end
