class SocialProviderObserver < ActiveRecord::Observer
  def after_pending(social_provider, transition)
    SocialProviderMailer.delay.pending_email(social_provider)
  end

  def after_publish(social_provider, transition)
    SocialProviderMailer.delay.publish_email(social_provider)
  end

  def after_draft(social_provider, transition)
    SocialProviderMailer.delay.draft_email(social_provider)
  end
end
