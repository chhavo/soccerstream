class Team < ActiveRecord::Base

  validates :team_name, :presence => true

  has_many :comments
  #has_many :users

end
