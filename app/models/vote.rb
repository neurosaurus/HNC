class Vote < ActiveRecord::Base

  attr_accessible :value, :target
  belongs_to :target, :polymorphic => true

end
