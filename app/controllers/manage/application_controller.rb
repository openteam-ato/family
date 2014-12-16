class Manage::ApplicationController < ActionController::Base
  protect_from_forgery
  inherit_resources

  layout 'manage'
end
