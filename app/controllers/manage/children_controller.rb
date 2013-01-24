class Manage::ChildrenController < ApplicationController
  inherit_resources

  layout 'manage'
  before_filter :set_locale

  def index
    @children = Child.search {
      with(:number, params[:search][:number]) if params[:search] && params[:search][:number].present?
      order_by(:published_on, :desc)
      order_by(:created_at, :desc)
      paginate(:page => params[:page] || 1, :per_page => 10)
    }.results
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
