class ChildrenController < ApplicationController
  inherit_resources

  layout 'manage'
  before_filter :set_locale

  def index
    @children = Child.search {
      with(:number, params[:search][:number]) if params[:search] && params[:search][:number].present?
    }.results
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
