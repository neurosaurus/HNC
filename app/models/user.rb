class User < ActiveRecord::Base
  include UsersHelper

  attr_accessible :email, :name

  before_save { |user| user.email = email.downcase}

  validates :name, :presence => true, :length => {maximum: 50}
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

end
