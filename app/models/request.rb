class Request < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone

  validates_presence_of :message, :name
  validates :email, :email_format => { :message => I18n.t('activerecord.errors.messages.invalid') }
end
