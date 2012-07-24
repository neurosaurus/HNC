class Story < ActiveRecord::Base
  attr_accessible :body, :created_at, :link, :title, :updated_at
end
