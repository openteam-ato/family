class RequestMailer < ActionMailer::Base
  default :from => 'noreply.tab.server@gmail.com'

  def send_email(request)
    @request = request
    mail(:to => 'tab@openteam.ru', :subject => 'New request')
  end
end
