class Comment < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user, :story
end
