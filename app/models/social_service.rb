class SocialService < ActiveRecord::Base
  belongs_to :social_provider
  attr_accessible :kind, :price, :title

  validates_presence_of :kind, :price, :title
end
