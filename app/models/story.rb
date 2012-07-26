class Story < ActiveRecord::Base
  attr_accessible :body, :created_at, :link, :title, :updated_at

  belongs_to :user
  has_many :votes, :as => :target
  validates :link, :format => {:with => /\A((http:\/\/)|(https:\/\/))/ }
  before_validation :ensure_link_has_prefix
  before_update :ensure_link_has_prefix


  # protected

  def ensure_link_has_prefix
    unless link =~ /((http:\/\/)|(https:\/\/))\S+/
      self.link = "http://#{link}"
    end
  end


end
