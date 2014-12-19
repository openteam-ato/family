class SocialProviderMailer < ActionMailer::Base
  default :from => Settings['mail']['from']

  def pending_email(social_provider)
    @social_provider = social_provider
    mail(:to => Settings['mail']['recipient'], :subject => 'Поступил новый запрос на публикацию информации о поставщике социальных услуг')
  end

  def draft_email(social_provider)
    @social_provider = social_provider
    mail(:to => @social_provider.user.email, :subject => "Отазано в публикации информации о '#{@social_provider.short_title}'")
  end

  def publish_email(social_provider)
    @social_provider = social_provider
    mail(:to => @social_provider.user.email, :subject => "Информация о поставщике социальных услуг опубликована")
  end
end
