class SocialProvider < ActiveRecord::Base
  attr_accessible :additional_info, :address, :audits, :chief_fio, :incorporation_form,
                  :register_date, :short_title, :terms_of_service, :title, :work_experience,
                  :phones_attributes, :emails_attributes, :licenses_attributes,
                  :social_forms_attributes, :social_services_attributes

  has_many :phones,          :dependent => :destroy
  has_many :emails,          :dependent => :destroy
  has_many :licenses,        :dependent => :destroy
  has_many :social_forms,    :dependent => :destroy
  has_many :social_services, :dependent => :destroy

  accepts_nested_attributes_for :phones, :emails, :licenses, :social_forms, :social_services, :allow_destroy => true
end
