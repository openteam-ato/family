# encoding: utf-8

class Request < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone

  validates_presence_of :name, :email, :message
  validates_format_of :name, :with => /\A([ёЁа-яА-Я]+\s*)+\z/
  validates :email, :email_format => { :message => I18n.t('activerecord.errors.messages.invalid') }
end
