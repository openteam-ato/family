class SocialForm < ActiveRecord::Base
  belongs_to :social_provider
  attr_accessible :free_places_number, :kind, :places_number

  validates_presence_of :free_places_number, :kind, :places_number
end
