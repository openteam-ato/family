class SocialProvider < ActiveRecord::Base
  attr_accessible :additional_info, :address, :audits, :chief_fio, :incorporation_form, :site,
                  :register_date, :short_title, :terms_of_service, :title, :work_experience,
                  :phones_attributes, :emails_attributes, :licenses_attributes,
                  :social_forms_attributes, :social_services_attributes,
                  :revert_to_draft_reason

  belongs_to :user

  has_many :phones,          :order => 'created_at', :dependent => :destroy
  has_many :emails,          :order => 'created_at', :dependent => :destroy
  has_many :licenses,        :order => 'created_at', :dependent => :destroy
  has_many :social_forms,    :order => 'created_at', :dependent => :destroy
  has_many :social_services, :order => 'created_at', :dependent => :destroy

  accepts_nested_attributes_for :phones, :emails, :licenses, :social_forms, :social_services, :allow_destroy => true

  validates_presence_of :title, :short_title, :register_date, :address, :chief_fio

  scope :not_draft, -> { where(:state => [:pending, :published]) }
  scope :published, ->(_) { where(:state => :published) }
  scope :by_update, -> { order('updated_at desc') }

  state_machine :initial => :draft do
    event :pending do
      transition :draft => :pending
    end

    event :publish do
      transition :pending => :published
    end

    event :draft do
      transition [:pending, :published] => :draft
    end
  end

  def places_full_number
    self.social_forms.map(&:places_number).compact.sum
  end

  def free_places_full_number
    self.social_forms.map(&:free_places_number).compact.sum
  end
end

# == Schema Information
#
# Table name: social_providers
#
#  id                     :integer          not null, primary key
#  title                  :text
#  short_title            :text
#  register_date          :date
#  incorporation_form     :text
#  address                :text
#  chief_fio              :text
#  terms_of_service       :text
#  audits                 :text
#  work_experience        :text
#  additional_info        :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#  site                   :string(255)
#  state                  :string(255)
#  revert_to_draft_reason :text
#

