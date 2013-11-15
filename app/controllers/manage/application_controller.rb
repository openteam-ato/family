class Manage::ApplicationController < ApplicationController
  protect_from_forgery
  inherit_resources

  layout 'manage'
end
