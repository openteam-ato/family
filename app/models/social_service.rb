class SocialService < ActiveRecord::Base
  extend Enumerize

  attr_accessible :kind, :price, :title
  belongs_to :social_provider, :touch => true

  enumerize :kind, :in => [:common, :medical, :psychological, :pedagogical, :labor, :legal, :communicative, :urgent]

  validates_presence_of :kind, :price, :title
end

# == Schema Information
#
# Table name: social_services
#
#  id                 :integer          not null, primary key
#  kind               :string(255)
#  title              :text
#  price              :string(255)
#  social_provider_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

