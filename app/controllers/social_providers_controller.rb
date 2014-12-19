class SocialProvidersController < MainController
  inherit_resources

  has_scope :published, :default => 1

  actions :index, :show

  def index
    index!{ @social_providers = @social_providers.page(params[:page] || 1).per(20) }
  end
end
