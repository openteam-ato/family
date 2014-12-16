class License < ActiveRecord::Base
  belongs_to :social_provider
  attr_accessible :activity_kind, :expiration_date, :issue_date, :issuing_organization, :number, :seria

  validates_presence_of :activity_kind, :expiration_date, :issue_date, :issuing_organization, :number, :seria
end
