class Story < ActiveRecord::Base
  attr_accessible :body, :created_at, :link, :title, :updated_at

  belongs_to :user
  has_many :votes, :as => :target

end
