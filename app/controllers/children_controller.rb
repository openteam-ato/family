class ChildrenController < ApplicationController
  inherit_resources

  layout 'manage'

  def index
    @children = Child.search {
      with(:number, params[:number]) if params[:number].present?
    }.results
  end
end
