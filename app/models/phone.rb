class Phone < Contact
  extend Enumerize

  enumerize :kind, :in => [:phone, :fax]

  validates_presence_of :kind, :value

  delegate :to_s, :to => :human_value

  def human_value
    "#{kind_text}: #{value}"
  end
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

