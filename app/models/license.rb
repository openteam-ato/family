class License < ActiveRecord::Base
  belongs_to :social_provider, :touch => true
  attr_accessible :activity_kind, :expiration_date, :issue_date, :issuing_organization, :number, :seria

  validates_presence_of :activity_kind, :issue_date, :issuing_organization, :number, :seria
end

# == Schema Information
#
# Table name: licenses
#
#  id                   :integer          not null, primary key
#  seria                :string(255)
#  number               :string(255)
#  activity_kind        :text
#  issuing_organization :text
#  issue_date           :date
#  expiration_date      :date
#  social_provider_id   :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

