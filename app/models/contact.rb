class Contact < ActiveRecord::Base
  belongs_to :social_provider, :touch => true
  attr_accessible :kind, :type, :value
end
