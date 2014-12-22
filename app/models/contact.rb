class Contact < ActiveRecord::Base
  belongs_to :social_provider, :touch => true
  attr_accessible :kind, :type, :value
end

# == Schema Information
#
# Table name: contacts
#
#  id                 :integer          not null, primary key
#  kind               :string(255)
#  value              :string(255)
#  social_provider_id :integer
#  type               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

