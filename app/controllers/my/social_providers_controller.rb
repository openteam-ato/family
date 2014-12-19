class My::SocialProvidersController < ApplicationController
  include Pundit

  before_filter :user_not_authorized, :unless => 'current_user.present?'

  def index
    @social_providers = policy_scope(SocialProvider)
  end


  def show
    @social_provider = SocialProvider.find(params[:id])
    authorize @social_provider, :manage?
  end

  def new
    @social_provider = current_user.social_providers.new
    authorize @social_provider, :manage?
  end

  def create
    @social_provider = current_user.social_providers.new(params[:social_provider])
    authorize @social_provider, :manage?

    if @social_provider.save!
      redirect_to my_social_provider_path(@social_provider)
    else
      render :new
    end
  end

  def edit
    @social_provider = SocialProvider.find(params[:id])
    authorize @social_provider
  end

  def update
    @social_provider = SocialProvider.find(params[:id])
    authorize @social_provider, :edit?
    if @social_provider.update_attributes(params[:social_provider])
      redirect_to my_social_provider_path(@social_provider)
    else
      render :edit
    end
  end

  def destroy
    @social_provider = SocialProvider.find(params[:id])
    authorize @social_provider

    @social_provider.destroy
    redirect_to my_social_providers_path
  end

  def pending
    @social_provider = SocialProvider.find(params[:id])
    authorize @social_provider, :to_pending?

    updated_at = @social_provider.updated_at
    @social_provider.pending!
    @social_provider.update_column :updated_at, updated_at
    redirect_to my_social_providers_path
  end

  private

  def user_not_authorized
    flash[:alert] = "Необходимо произвести вход в систему"
    redirect_to social_providers_path
  end
end
