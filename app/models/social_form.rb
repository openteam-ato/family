class SocialForm < ActiveRecord::Base
  extend Enumerize

  attr_accessible :free_places_number, :kind, :places_number
  belongs_to :social_provider

  enumerize :kind, :in => [:home, :semi_stationary, :stationary]

  validates_presence_of :free_places_number, :kind, :places_number
end
