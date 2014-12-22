class SocialForm < ActiveRecord::Base
  extend Enumerize

  attr_accessible :free_places_number, :kind, :places_number
  belongs_to :social_provider, :touch => true

  enumerize :kind, :in => [:home, :semi_stationary, :stationary]

  validates_presence_of :free_places_number, :kind, :places_number

  validates_uniqueness_of :kind, :scope => :social_provider_id, :message => 'Не может быть несколько одинаковых форм'

  default_value_for :places_number, 0
  default_value_for :free_places_number, 0
end

# == Schema Information
#
# Table name: social_forms
#
#  id                 :integer          not null, primary key
#  kind               :string(255)
#  places_number      :integer
#  free_places_number :integer
#  social_provider_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

