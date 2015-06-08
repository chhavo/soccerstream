class Comment < ActiveRecord::Base

  #validates :comments, :presence => true

  belongs_to :user
  belongs_to :team

end
