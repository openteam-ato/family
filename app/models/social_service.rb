class SocialService < ActiveRecord::Base
  extend Enumerize

  attr_accessible :kind, :price, :title
  belongs_to :social_provider, :touch => true

  enumerize :kind, :in => [:common, :medical, :psychological, :pedagogical, :labor, :legal, :communicative, :urgent]

  validates_presence_of :kind, :price, :title
end
