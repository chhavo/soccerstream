class FixColumns < ActiveRecord::Migration
  def change
    remove_column :comments, :team_name
    remove_column :comments, :user_id

    add_column :comments, :team_id, :integer
    add_column :comments, :user_id, :integer
  end
end
