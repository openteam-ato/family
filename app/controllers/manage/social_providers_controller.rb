class Manage::SocialProvidersController < Manage::ApplicationController
  def index
    @social_providers = SocialProvider.not_draft.by_update
  end

  def show
    @social_provider = SocialProvider.find(params[:id])
  end

  def publish
    @social_provider = SocialProvider.find(params[:id])

    @social_provider.publish!
    redirect_to manage_social_providers_path
  end

  def draft
    @social_provider = SocialProvider.find(params[:id])

    @social_provider.draft!
    redirect_to manage_social_providers_path
  end

  def destroy
    @social_provider = SocialProvider.find(params[:id])

    @social_provider.destroy
    redirect_to manage_social_providers_path
  end
end
