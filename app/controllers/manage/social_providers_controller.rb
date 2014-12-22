class Manage::SocialProvidersController < Manage::ApplicationController
  def index
    @social_providers = SocialProvider.not_draft.by_update
  end

  def show
    @social_provider = SocialProvider.find(params[:id])
  end

  def publish
    @social_provider = SocialProvider.find(params[:id])

    updated_at = @social_provider.updated_at
    @social_provider.publish!
    @social_provider.update_column :updated_at, updated_at
    redirect_to manage_social_providers_path
  end

  def draft
    @social_provider = SocialProvider.find(params[:id])
    @social_provider.revert_to_draft_reason = params[:reason]
    @social_provider.save

    updated_at = @social_provider.updated_at
    @social_provider.draft!
    @social_provider.update_column :updated_at, updated_at
    redirect_to manage_social_providers_path
  end

  def destroy
    @social_provider = SocialProvider.find(params[:id])

    @social_provider.destroy
    redirect_to manage_social_providers_path
  end
end
