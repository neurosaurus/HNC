class Comment < ActiveRecord::Base
  attr_accessible :body, :story_id, :user_id

  belongs_to :user
  belongs_to :story
  has_many :votes, :as => :target

end
