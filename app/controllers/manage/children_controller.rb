class Manage::ChildrenController < ApplicationController
  inherit_resources

  layout 'manage'
  before_filter :set_locale

  def index
    @children = Child.solr_search_results(params)
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
