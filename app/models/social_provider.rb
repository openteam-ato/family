class SocialProvider < ActiveRecord::Base
  attr_accessible :additional_info, :address, :audits, :chief_fio, :incorporation_form, :register_date, :short_title, :terms_of_service, :title, :work_experience
end
