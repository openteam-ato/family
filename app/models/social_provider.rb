class SocialProvider < ActiveRecord::Base
  attr_accessible :additional_info, :address, :audits, :chief_fio, :incorporation_form, :register_date, :short_title, :terms_of_service, :title, :work_experience

  has_many :phones,       :dependent => :destroy
  has_many :emails,       :dependent => :destroy
  has_many :licenses,     :dependent => :destroy
  has_many :social_forms, :dependent => :destroy
end
