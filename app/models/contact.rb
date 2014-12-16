class Contact < ActiveRecord::Base
  belongs_to :social_place
  attr_accessible :kind, :type, :value
end
