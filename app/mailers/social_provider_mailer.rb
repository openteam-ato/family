class SocialProviderMailer < ActionMailer::Base
  default :from => Settings['mail']['from']

  def pending_email(social_provider)
    @social_provider = social_provider
    mail(:to => Settings['mail']['recipient'], :subject => 'Поступил новый запрос на публикацию поставщика услуг')
  end

  def draft_email(social_provider)
    @social_provider = social_provider
    mail(:to => @social_provider.user.email, :subject => "Отазано в публикации записи '#{@social_provider.short_title}'")
  end

  def publish_email(social_provider)
    @social_provider = social_provider
    mail(:to => @social_provider.user.email, :subject => "Запись '#{@social_provider.short_title}' опубликована")
  end
end
